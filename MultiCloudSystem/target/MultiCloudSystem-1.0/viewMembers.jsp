<%@ page import="java.sql.*" %>
<%@ page import="com.multicloud.db.DBConnection" %>

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
    <title>View Members</title>

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

        /* TABLE */
        table {
            border-collapse: collapse;
            width: 70%;
            margin: auto;
            background-color: #ffffff;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        th {
            background-color: #ff6f7d;
            color: white;
            padding: 12px;
            font-size: 16px;
        }

        td {
            padding: 10px;
            text-align: center;
            font-size: 15px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .back-link {
            margin-top: 25px;
        }

        .back-link a {
            background-color: #ff6f7d;
            color: white;
            padding: 10px 30px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: bold;
            font-size: 15px;
        }

        .back-link a:hover {
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
        <a href="adminLogout.jsp">Logout</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">
    <h2>Registered Members</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
        </tr>

        <%
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM members");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("email") %></td>
        </tr>
        <%
            }
        %>
    </table>

    <div class="back-link">
        <a href="adminHome.jsp">Back</a>
    </div>

    <div class="footer">
        All rights reserved
    </div>
</div>

</body>
</html>
