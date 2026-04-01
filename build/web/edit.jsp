<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Audience</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #eef2f7;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .edit-box {
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 15px #bbb;
                width: 400px;
            }

            .edit-box h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .edit-box input {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .edit-box input[type=submit] {
                background-color: #007bff;
                color: white;
                border: none;
                cursor: pointer;
            }

            .edit-box input[type=submit]:hover {
                background-color: #0056b3;
            }

            .edit-box input[readonly] {
                background-color: #f0f0f0;
            }
        </style>
    </head>
    <body>

        <%
            String email = "";
            String name = "";
            String mobile = "";

            try {
                email = request.getParameter("rolll");

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection cn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/cricketdb", "root", "root");

                PreparedStatement ps = cn.prepareStatement(
                        "SELECT * FROM audience WHERE email=?");

                ps.setString(1, email);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    name = rs.getString("name");
                    mobile = rs.getString("mobile");
                }

                cn.close();

            } catch (Exception ex) {
                out.println("<p style='color:red;text-align:center;'>Error: " + ex + "</p>");
            }
        %>


        <div class="edit-box">
            <h2>Edit Audience</h2>
            <form action="Update.jsp" method="post">
                <label>Email </label>
                <input type="text" name="email" value="<%= email%>" readonly>
                <label>Name</label>
                <input type="text" name="name" value="<%= name%>" placeholder="Enter Name" required>
                <label>Mobile</label>
                <input type="text" name="mobile" value="<%= mobile%>" placeholder="Enter Mobile" required>
                <input type="submit" value="Update">
            </form>
        </div>

    </body>
</html>
