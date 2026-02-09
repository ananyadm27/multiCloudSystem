<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>

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
            margin-bottom: 15px;
        }

        .container p {
            font-size: 18px;
            color: green;
            font-weight: bold;
        }

        /* ACTION BOX */
        .action-box {
            background-color: #ffffff;
            width: 450px;
            margin: 30px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .action-box a {
            display: block;
            margin: 15px 0;
            padding: 12px;
            background-color: #ff6f7d;
            color: white;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 20px;
        }

        .action-box a:hover {
            background-color: #e85c6a;
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
        <a href="adminHome.jsp">Home</a>
        <a href="adminCreateCloud.jsp">Create Cloud</a>
        <a href="viewClouds.jsp">View Clouds</a>
        <a href="viewMembers.jsp">View Members</a>
        <a href="memberLogout.jsp">Logout</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">
    <h2>Admin Dashboard</h2>
    <p>Login Successful</p>

    <div class="action-box">
        <a href="adminCreateCloud.jsp">Create Cloud</a>
        <a href="viewClouds.jsp">View Clouds</a>
        <a href="viewMembers.jsp">View Members</a>
        <a href="memberLogout.jsp">Logout</a>
    </div>

    <div class="footer">
        All rights reserved
    </div>
</div>

</body>
</html>
