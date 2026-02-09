package com.multicloud.servlet;

import com.multicloud.db.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/MemberLoginServlet")
public class MemberLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // VALIDATION
        if (username == null || password == null ||
            username.isEmpty() || password.isEmpty()) {
            response.sendRedirect("memberLogin.jsp?error=empty");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM members WHERE username=? AND password=?");

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("member", username);
                response.sendRedirect("memberHome.jsp");
            } else {
                response.sendRedirect("memberLogin.jsp?error=invalid");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("memberLogin.jsp?error=failed");
        }
    }
}
