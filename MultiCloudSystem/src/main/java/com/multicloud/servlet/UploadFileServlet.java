package com.multicloud.servlet;

import com.multicloud.db.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.net.ftp.FTPClient;

@WebServlet("/UploadFileServlet")
@MultipartConfig
public class UploadFileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("member");

        if (username == null) {
            response.sendRedirect("memberLogin.jsp");
            return;
        }

        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        InputStream fileContent = filePart.getInputStream();

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM cloud_details WHERE status='ACTIVE'");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String cloudName = rs.getString("cloud_name");
                String host = rs.getString("ftp_host");
                String user = rs.getString("ftp_username");
                String pass = rs.getString("ftp_password");

                FTPClient ftp = new FTPClient();
                String status;

                try {
                    ftp.connect(host);
                    ftp.login(user, pass);
                    ftp.enterLocalPassiveMode();
                    ftp.storeFile(fileName, fileContent);
                    status = "SUCCESS";
                } catch (Exception e) {
                    status = "FAILED";
                } finally {
                    try {
                        ftp.logout();
                        ftp.disconnect();
                    } catch (Exception ex) {
                        // ignore
                    }
                }

                PreparedStatement log = con.prepareStatement(
                    "INSERT INTO file_transactions(username,filename,cloud_name,status) VALUES (?,?,?,?)");
                log.setString(1, username);
                log.setString(2, fileName);
                log.setString(3, cloudName);
                log.setString(4, status);
                log.executeUpdate();
            }

            response.sendRedirect("viewReports.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("memberUpload.jsp?error=failed");
        }
    }
}
