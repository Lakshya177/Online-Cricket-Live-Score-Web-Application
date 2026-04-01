<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Future Matches</title>
        <style>
            table {
                width: 80%;
                margin: auto;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: center;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }
            a {
                text-decoration: none;
                padding: 5px 10px;
                color: white;
                border-radius: 5px;
            }
            .edit {
                background: blue;
            }
            .delete {
                background: red;
            }
            .header {
                position: relative;
                width: 100%;
                padding: 15px 30px;
            }

            .logout-btn {
                position: absolute;
                right: 66px;
                top: 15px;
                background: red;
                color: white;
                padding: 8px 15px;
                border-radius: 5px;
                text-decoration: none;
                font-weight: bold;
            }

        </style>
    </head>
    <body>

        <div class="header">
            <h2 align="center">Future Matches List</h2>
            <a href="admin_home.jsp" class="logout-btn">Home</a>
        </div>


        <table>
            <tr>
                <th>Match ID</th>
                <th>Match Date</th>
                <th>Start Time</th>
                <th>Team 1</th>
                <th>Team 2</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricketdb", "root", "root");

                    String sql = "SELECT Match_id, Match_Date, Match_Start_Time, MatchTeam1, MatchTeam2 FROM Future_Match";
                    ps = con.prepareStatement(sql);
                    rs = ps.executeQuery();

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("Match_id")%></td>
                <td><%= rs.getString("Match_Date")%></td>
                <td><%= rs.getString("Match_Start_Time")%></td>
                <td><%= rs.getString("MatchTeam1")%></td>
                <td><%= rs.getString("MatchTeam2")%></td>

                <td>
                    <a class="edit" href="Edit_Future_Match.jsp?id=<%= rs.getInt("Match_id")%>">Edit</a>
                </td>
                <td>
                    <a class="delete" href="Delete_Future_Match.jsp?id=<%= rs.getInt("Match_id")%>"
                       onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<h3 style='color:red; text-align:center;'>Error: " + e.getMessage() + "</h3>");
                } finally {
                    if (rs != null) {
                        rs.close();
                    }
                    if (ps != null) {
                        ps.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                }
            %>
        </table>

    </body>
</html>
