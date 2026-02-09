<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Member Registration</title>

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
            margin-bottom: 20px;
        }

        /* FORM BOX */
        .form-box {
            background-color: #ffffff;
            width: 380px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .form-box input[type="text"],
        .form-box input[type="password"],
        .form-box input[type="email"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }

        .form-box input[type="submit"] {
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

        .form-box input[type="submit"]:hover {
            background-color: #e85c6a;
        }

        .msg {
            margin-bottom: 15px;
            font-weight: bold;
            color: red;
        }

        .login-link {
            margin-top: 15px;
            display: block;
            font-size: 14px;
        }

        .login-link a {
            color: #ff6f7d;
            font-weight: bold;
            text-decoration: none;
        }

        .login-link a:hover {
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
    <h2>Member Registration</h2>

    <div class="form-box">

        <% if (request.getParameter("error") != null) { %>
            <div class="msg">Registration Failed</div>
        <% } %>

        <!-- 🔴 LOGIC UNCHANGED -->
        <form action="MemberRegisterServlet" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="submit" value="Register">
        </form>

        <div class="login-link">
            <a href="memberLogin.jsp">Already registered? Login</a>
        </div>

    </div>

    <div class="footer">
        All rights reserved
    </div>
</div>

</body>
</html>
