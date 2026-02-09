package com.multicloud.servlet;

import com.multicloud.db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CreateCloudServlet")
public class CreateCloudServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cloudName = request.getParameter("cloudName");
        String ftpHost = request.getParameter("ftpHost");
        String ftpUser = request.getParameter("ftpUser");
        String ftpPass = request.getParameter("ftpPass");
        String status = request.getParameter("status");

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO cloud_details(cloud_name,ftp_host,ftp_username,ftp_password,status) VALUES (?,?,?,?,?)");

            ps.setString(1, cloudName);
            ps.setString(2, ftpHost);
            ps.setString(3, ftpUser);
            ps.setString(4, ftpPass);
            ps.setString(5, status);

            ps.executeUpdate();
            response.sendRedirect("adminHome.jsp?msg=cloudAdded");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminCreateCloud.jsp?error=failed");
        }
    }
}
