<%
    if (session.getAttribute("member") == null) {
        response.sendRedirect("memberLogin.jsp");
        return;
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload File</title>

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
            width: 420px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .form-box input[type="file"] {
            width: 90%;
            padding: 10px;
            margin: 15px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
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
        <a href="memberHome.jsp">Home</a>
        <a href="memberUpload.jsp">Upload</a>
        <a href="viewReports.jsp">Reports</a>
        <a href="downloads.jsp">Downloads</a>
        <a href="memberLogout.jsp">Logout</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">
    <h2>Upload File (Multi-Cloud)</h2>

    <div class="form-box">

        <!-- 🔴 LOGIC UNCHANGED -->
        <form action="UploadFileServlet" method="post" enctype="multipart/form-data">
            <input type="file" name="file" required>
            <input type="submit" value="Upload">
        </form>

        <div class="back-link">
            <a href="memberHome.jsp">Back</a>
        </div>

    </div>

    <div class="footer">
       All rights reserved
    </div>
</div>

</body>
</html>
