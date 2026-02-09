<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Multi-Cloud System</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f5f5f5;
        }

        /* Top Header */
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

        /* Main Content */
        .content {
            margin-top: 80px;
            text-align: center;
        }

        .content h2 {
            font-size: 30px;
            color: #333;
            margin-bottom: 30px;
        }

        .links a {
            display: inline-block;
            margin: 15px;
            padding: 12px 30px;
            background-color: #ff6f7d;
            color: white;
            text-decoration: none;
            border-radius: 25px;
            font-size: 16px;
            font-weight: bold;
            box-shadow: 0 3px 6px rgba(0,0,0,0.2);
        }

        .links a:hover {
            background-color: #e85c6a;
        }

        /* Footer Logo/Text */
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

    <!-- MAIN CONTENT -->
    <div class="content">
        <h2>Multi-Cloud System to Avoid Server Failures</h2>

        <div class="links">
            <!-- LOGIC NOT CHANGED -->
            <a href="adminLogin.jsp">Admin Login</a>
            <a href="memberLogin.jsp">Member Login</a>
            <a href="memberRegister.jsp">New Member Registration</a>
        </div>

        <div class="footer">
            All rights reserved
        </div>
    </div>

</body>
</html>
