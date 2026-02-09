<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Member Login</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f4f4;
        }

        /* HEADER */
        .header {
            background-color: #ff6f7d;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .header .title {
            font-size: 28px;
            font-weight: bold;
            color: #0b2c4d;
            letter-spacing: 2px;
        }

        .header .menu a {
            color: white;
            text-decoration: none;
            margin-left: 25px;
            font-size: 16px;
            font-weight: bold;
        }

        .header .menu a:hover {
            text-decoration: underline;
        }

        /* CONTENT */
        .container {
            margin-top: 90px;
            text-align: center;
        }

        .container h2 {
            font-size: 30px;
            color: #333;
            margin-bottom: 30px;
        }

        /* LOGIN BOX */
        .login-box {
            background-color: #ffffff;
            width: 350px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }

        .login-box input[type="submit"] {
            background-color: #ff6f7d;
            color: white;
            border: none;
            padding: 10px 30px;
            border-radius: 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 15px;
        }

        .login-box input[type="submit"]:hover {
            background-color: #e85c6a;
        }

        .msg {
            margin-top: 15px;
            font-weight: bold;
            color: red;
        }

        .register-link {
            margin-top: 15px;
            display: block;
            font-size: 14px;
        }

        .register-link a {
            color: #ff6f7d;
            font-weight: bold;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

         .footer {
            margin-top: 250px;
            font-size: 18px;
            color: #000;
            font-weight: bold;
              background-color: #ff6f7d;
            padding: 20px 40px;
             align-items: center;
        }
    </style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <div class="title">MULTI-CLOUD</div>
    <div class="menu">
        <a href="index.jsp">Home</a>
        <a href="adminLogin.jsp">Admin</a>
        <a href="memberLogin.jsp">Member</a>
        <a href="memberRegister.jsp">Registration</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">
    <h2>Member Login</h2>

    <div class="login-box">

        <!-- 🔴 LOGIC UNCHANGED -->
        <form action="MemberLoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>

        <% if (request.getParameter("error") != null) { %>
            <div class="msg">Invalid username or password</div>
        <% } %>

        <div class="register-link">
            <a href="memberRegister.jsp">New User? Register Here</a>
        </div>

        <div class="msg">
            <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
        </div>

    </div>

   <div class="footer">
            All rights reserved
        </div>
</div>

</body>
</html>
