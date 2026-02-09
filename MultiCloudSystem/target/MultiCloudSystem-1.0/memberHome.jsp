<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("member");
    if (user == null) {
        response.sendRedirect("memberLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Member Home</title>

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
            margin-bottom: 10px;
        }

        .container p {
            font-size: 18px;
            color: green;
            font-weight: bold;
            margin-bottom: 30px;
        }

        /* DASHBOARD BOX */
        .dashboard {
            background-color: #ffffff;
            width: 450px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .dashboard ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .dashboard ul li {
            margin: 15px 0;
        }

        .dashboard ul li a {
            display: block;
            padding: 12px;
            background-color: #ff6f7d;
            color: white;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 20px;
        }

        .dashboard ul li a:hover {
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
        <a href="memberHome.jsp">Home</a>
        <a href="memberUpload.jsp">Upload</a>
        <a href="viewReports.jsp">Reports</a>
        <a href="downloads.jsp">Downloads</a>
        <a href="memberLogout.jsp">Logout</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">
    <h2>Welcome, <%= user %></h2>
    <p>Login Successful</p>

    <div class="dashboard">
        <ul>
            <!-- 🔴 LOGIC UNCHANGED -->
            <li><a href="memberUpload.jsp">Upload File</a></li>
            <li><a href="viewReports.jsp">View Reports</a></li>
            <li><a href="downloads.jsp">Downloads</a></li>
            <li><a href="memberLogout.jsp">Logout</a></li>
        </ul>
    </div>

    <div class="footer">
        All rights reserved
    </div>
</div>

</body>
</html>
