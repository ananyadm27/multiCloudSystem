<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Cloud</title>

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
            margin-top: 80px;
            text-align: center;
        }

        .container h2 {
            font-size: 30px;
            color: #333;
            margin-bottom: 30px;
        }

        /* FORM BOX */
        .form-box {
            background-color: #ffffff;
            width: 420px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .form-box input,
        .form-box select {
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
            margin-top: 20px;
        }

        .form-box input[type="submit"]:hover {
            background-color: #e85c6a;
        }

        .back-link {
            margin-top: 20px;
            display: block;
        }

        .back-link a {
            color: #ff6f7d;
            font-weight: bold;
            text-decoration: none;
        }

        .back-link a:hover {
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
        <a href="adminHome.jsp">Home</a>
        <a href="createCloud.jsp">Create Cloud</a>
        <a href="adminLogout.jsp">Logout</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">
    <h2>Create Cloud Account</h2>

    <div class="form-box">

        <!-- 🔴 LOGIC UNCHANGED -->
        <form action="CreateCloudServlet" method="post">

            <input type="text" name="cloudName" placeholder="Cloud Name" required>

            <input type="text" name="ftpHost" value="ftp.drivehq.com" required>

            <input type="text" name="ftpUser" placeholder="FTP Username" required>

            <input type="password" name="ftpPass" placeholder="FTP Password" required>

            <select name="status">
                <option value="ACTIVE">ACTIVE</option>
                <option value="DISABLED">DISABLED</option>
            </select>

            <input type="submit" value="Create Cloud">
        </form>

        <div class="back-link">
            <a href="adminHome.jsp">Back</a>
        </div>
    </div>

    <div class="footer">
        All rights reserved
    </div>
</div>

</body>
</html>
