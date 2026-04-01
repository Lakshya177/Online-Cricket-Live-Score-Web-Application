<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Delete Audience</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #eef2f7;
                text-align: center;
                padding-top: 50px;
            }
            h3 {
                color: red;
            }
            a {
                text-decoration: none;
                color: white;
                background-color: #007bff;
                padding: 8px 20px;
                border-radius: 5px;
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
            ResultSet rs = null;

            String name = "";
            String email = "";
            String mobile = "";

            try {

                String roll = request.getParameter("rolll");   // email value

                if (roll != null && !roll.isEmpty()) {

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    cn = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/cricketdb", "root", "root");

                    // 1️⃣ Fetch record first
                    ps = cn.prepareStatement("SELECT * FROM audience WHERE email=?");
                    ps.setString(1, roll);
                    rs = ps.executeQuery();

                    if (rs.next()) {

                        name = rs.getString("name");
                        email = rs.getString("email");
                        mobile = rs.getString("mobile");

                        // 2️⃣ Delete record
                        PreparedStatement ps2 = cn.prepareStatement("DELETE FROM audience WHERE email=?");
                        ps2.setString(1, roll);
                        int rows = ps2.executeUpdate();

                        if (rows > 0) {
        %>

        <h3>Record Deleted Successfully!</h3>
        <p><b>Name:</b> <%= name%></p>
        <p><b>Email:</b> <%= email%></p>
        <p><b>Mobile:</b> <%= mobile%></p>

        <%
                        }

                    } else {
                        out.println("<h3>Record Not Found!</h3>");
                    }

                    cn.close();

                } else {
                    out.println("<h3>Invalid Request!</h3>");
                }

            } catch (Exception ex) {
                out.println("<p style='color:red;'>Error: " + ex + "</p>");
            }
        %>

        <br>
        <a href='index.html'>Home</a>

    </body>
</html>
