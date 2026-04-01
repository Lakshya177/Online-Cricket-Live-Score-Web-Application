<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Upcoming Matches</title>
        <style>
            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid black;
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: blue;
                color: white;
            }
            .top-links {
                text-align: right;
                margin: 10px 20px;
            }
            .top-links a {
                margin-left: 15px;
                text-decoration: none;
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <!-- ? Home & Logout (Right Side Top) -->
        <div class="top-links">
            <a href="Home">Home</a>
            <a href="Logout">Logout</a>
        </div>

        <h2 style="text-align:center;">Upcoming Matches</h2>

        <table>
            <tr>
                <th>Match ID</th>
                <th>Match Date</th>
                <th>Start Time</th>
                <th>Team 1</th>
                <th>Team 2</th>
            </tr>

            <%
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/cricketdb", "root", "root");

                    String sql = "SELECT * "
                            + "FROM Future_Match "
                            + "WHERE Match_Date > CURDATE()";

                    st = con.createStatement();
                    rs = st.executeQuery(sql);

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("Match_id")%></td>
                <td><%= rs.getDate("Match_Date")%></td>
                <td><%= rs.getTime("Match_Start_Time")%></td>
                <td><%= rs.getString("MatchTeam1")%></td>
                <td><%= rs.getString("MatchTeam2")%></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("Error: " + e);
                } finally {
                    if (rs != null) {
                        rs.close();
                    }
                    if (st != null) {
                        st.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                }
            %>

        </table>
    </body>
</html>
