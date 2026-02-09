package com.multicloud.servlet;

import com.multicloud.db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/MemberRegisterServlet")
public class MemberRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // VALIDATION
        if (username == null || password == null || email == null ||
            username.isEmpty() || password.isEmpty() || email.isEmpty()) {
            response.sendRedirect("memberRegister.jsp?error=empty");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO members(username,password,email) VALUES (?,?,?)");

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);

            ps.executeUpdate();
            response.sendRedirect("memberLogin.jsp?msg=registered");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("memberRegister.jsp?error=failed");
        }
    }
}
