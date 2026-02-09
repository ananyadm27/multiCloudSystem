package com.multicloud.servlet;

import com.multicloud.db.DBConnection;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/DownloadFileServlet")
public class DownloadFileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔐 SESSION CHECK (USE SAME KEY EVERYWHERE)
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("member");

        if (user == null) {
            response.sendRedirect("memberLogin.jsp");
            return;
        }

        String fileName = request.getParameter("file");

        if (fileName == null || fileName.trim().isEmpty()) {
            response.sendRedirect("downloads.jsp?msg=invalid");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {

            // 🔹 NOTE: status must match DB exactly
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM cloud_details WHERE status='ACTIVE'"
            );
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                String host = rs.getString("ftp_host");
                String uname = rs.getString("ftp_username");
                String pass = rs.getString("ftp_password");

                FTPClient ftp = new FTPClient();

                try {
                    System.out.println("Connecting to FTP: " + host);

                    ftp.connect(host);
                    ftp.login(uname, pass);

                    // ✅ REQUIRED FOR DRIVEHQ
                    ftp.enterLocalPassiveMode();
                    ftp.setFileType(FTP.BINARY_FILE_TYPE);
                    ftp.changeWorkingDirectory("/");

                    int reply = ftp.getReplyCode();
                    System.out.println("FTP Reply Code: " + reply);

                    File downloadDir = new File("C:/Users/ksseeb/Downloads/MultiCloud");
                    if (!downloadDir.exists()) {
                        downloadDir.mkdirs();
                    }

                    File localFile = new File(downloadDir, fileName);
                    System.out.println("Downloading to: " + localFile.getAbsolutePath());

                    try (FileOutputStream fos = new FileOutputStream(localFile)) {
                        boolean success = ftp.retrieveFile(fileName, fos);
                        System.out.println("FTP Download Success: " + success);

                        if (success) {
                            // ✅ LOG DOWNLOAD IN DB
                            PreparedStatement ps2 = con.prepareStatement(
                                "INSERT INTO downloads(username, filename, cloud_ip, status) VALUES (?,?,?,?)"
                            );
                            ps2.setString(1, user);
                            ps2.setString(2, fileName);
                            ps2.setString(3, host);
                            ps2.setString(4, "SUCCESS");
                            ps2.executeUpdate();

                            ftp.logout();
                            ftp.disconnect();

                            // ✅ REDIRECT TO DOWNLOADS PAGE
                            response.sendRedirect("downloads.jsp");
                            return;
                        }
                    }

                    ftp.logout();
                    ftp.disconnect();

                } catch (Exception e) {
                    // Try next cloud if this one fails
                    System.out.println("FTP failed for host: " + host);
                    e.printStackTrace();
                }
            }

            // ❌ FILE NOT FOUND IN ANY CLOUD
            response.sendRedirect("downloads.jsp?msg=failed");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("downloads.jsp?msg=error");
        }
    }
}
