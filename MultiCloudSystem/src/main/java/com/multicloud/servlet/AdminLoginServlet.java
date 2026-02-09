package com.multicloud.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // HARD CODED ADMIN LOGIN
        if ("admin".equals(username) && "admin".equals(password)) {

            HttpSession session = request.getSession();
            session.setAttribute("admin", "admin");

            response.sendRedirect("adminHome.jsp");

        } else {
            response.sendRedirect("adminLogin.jsp?error=invalid");
        }
    }
}
