<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Audience List</title>
        <style>
            table {
                border-collapse: collapse;
                width: 70%;
                margin: auto;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: center;
            }
            th {
                background-color: #007bff;
                color: white;
            }
            caption {
                margin-bottom: 10px;
                font-size: 24px;
                font-weight: bold;
            }
            a img {
                height: 30px;
                width: 30px;
            }
            .home-btn {
                position: absolute;
                top: 20px;
                right: 20px;
                text-decoration: none;
                color: red;
                border: 2px solid red;
                padding: 8px 15px;
                border-radius: 5px;
                font-weight: bold;
            }
            .home-btn:hover {
                background: red;
                color: white;
            }

        </style>
    </head>
    <body>

        <%
            try {
                // Load the driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Make the connection object
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricketdb", "root", "root");
                // Make the PreparedStatement object
                PreparedStatement ps = cn.prepareStatement("SELECT * FROM audience");
                // Execute query
                ResultSet rs = ps.executeQuery();
        %>

        <table>
            <caption>Audience List</caption>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
            </tr>

            <%
                while (rs.next()) {
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String mobile = rs.getString("mobile");
            %>
            <tr>
                <td><%= name%></td>
                <td><%= email%></td>
                <td><%= mobile%></td>
            </tr>
            <%
                    }
                    cn.close();
                } catch (Exception ex) {
                    out.println("<p style='color:red;text-align:center;'>Error: " + ex + "</p>");
                }
            %>

            <a href="index.html" class="home-btn">Home</a>

        </table>

    </body>
</html>
