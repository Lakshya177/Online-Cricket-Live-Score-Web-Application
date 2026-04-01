<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Audience</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #eef2f7;
                text-align: center;
                padding-top: 60px;
            }
            h3 {
                color: green;
            }
            .error {
                color: red;
            }
            a {
                text-decoration: none;
                color: white;
                background-color: #007bff;
                padding: 8px 20px;
                border-radius: 5px;
                display: inline-block;
                margin-top: 15px;
            }
            a:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <%
            Connection cn = null;
            PreparedStatement ps = null;

            try {

                String email = request.getParameter("email");
                String name = request.getParameter("name");
                String mobile = request.getParameter("mobile");

                Class.forName("com.mysql.cj.jdbc.Driver");
                cn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/cricketdb", "root", "root");

                ps = cn.prepareStatement(
                        "UPDATE audience SET name=?, mobile=? WHERE email=?");

                ps.setString(1, name);
                ps.setString(2, mobile);
                ps.setString(3, email);

                int rows = ps.executeUpdate();

                if (rows > 0) {
                    out.println("<h3>Update Successful!</h3>");
                    out.println("<p>Updated Email: <strong>" + email + "</strong></p>");
                    out.println("<a href='index.html'>Home</a>");
                } else {
                    out.println("<h3>Update Failed! Email not found.</h3>");
                    out.println("<a href='index.html'>Home</a>");
                }

            } catch (Exception ex) {
                out.println("<p style='color:red;'>Error: " + ex + "</p>");
            } finally {
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            }
        %>


    </body>
</html>

