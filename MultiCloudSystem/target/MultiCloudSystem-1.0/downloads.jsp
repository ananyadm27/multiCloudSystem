<%@ page import="java.sql.*" %>
<%@ page import="com.multicloud.db.DBConnection" %>

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
    <title>Downloaded Files</title>

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
            width: 85%;
            margin: 0 auto;
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
        <a href="memberHome.jsp">Member Home</a>
        
        
        <a href="downloads.jsp">Downloads</a>
        <a href="memberLogout.jsp">Logout</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">
    <h2>Downloaded Files</h2>

    <table>
        <tr>
            <th>Filename</th>
            <th>Cloud</th>
            <th>Status</th>
            <th>Date</th>
        </tr>

        <%
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM downloads WHERE username=? ORDER BY download_time DESC"
        );
        ps.setString(1, user);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString("filename")%></td>
            <td><%=rs.getString("cloud_ip")%></td>
            <td><%=rs.getString("status")%></td>
            <td><%=rs.getTimestamp("download_time")%></td>
        </tr>
        <% } %>
    </table>

    <div class="footer">
        All rights reserved
    </div>
</div>

</body>
</html>
