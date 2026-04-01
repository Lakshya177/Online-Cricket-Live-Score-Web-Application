<%-- 
    Document   : ShowHistoryMatches2.jsp
    Created on : 11 Feb 2026, 8:13:57?am
    Author     : hp1
--%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>History Matches</title>
        <style>
            table {
                width: 95%;
                margin:auto;
                border-collapse: collapse;
            }
            th,td {
                border:1px solid black;
                padding:8px;
                text-align:center;
            }
            th {
                background:#4CAF50;
                color:white;
            }

            /* ===== Top Right Menu ===== */
            .top-menu {
                position: absolute;
                top: 15px;
                right: 20px;
            }

            .top-menu a {
                margin-left: 15px;
                text-decoration: none;
                font-weight: bold;
                color: white;
                background: #2196F3;
                padding: 8px 12px;
                border-radius: 5px;
                transition: 0.3s;
            }

            /* Animation (Hover Effect) */
            .top-menu a:hover {
                background: #0b7dda;
                transform: scale(1.1);
            }

            /* Buttons */
            .edit-btn {
                padding: 5px 10px;
                background: #2196F3;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }

            .delete-btn {
                padding: 5px 10px;
                background: #f44336;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>

        <!-- ===== Home & Logout (Right Side Top) ===== -->
        <div class="top-menu">
            <a href="Home">Home</a>
            <a href="Logout">Logout</a>
        </div>

        <h2 align="center">History of Matches</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Match Date</th>
                <th>Team 1</th>
                <th>Team 2</th>
                <th>Winning Team</th>
                <th>Highest Score</th>
                <th>Highest Wicket</th>
                <th>Highest Score Player</th>
                <th>Highest Wicket  Player</th>
                <th>Man of the Match</th>
            </tr>

            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricketdb", "root", "root");

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM history_match");

                while (rs.next()) {
                    int id = rs.getInt("match_id");
            %>
            <tr>
                <td><%= id%></td>
                <td><%= rs.getString("match_date")%></td>
                <td><%= rs.getString("team1")%></td>
                <td><%= rs.getString("team2")%></td>
                <td><%= rs.getString("winning_team")%></td>
                <td><%= rs.getInt("highest_score")%></td>
                <td><%= rs.getInt("highest_wicket")%></td>
                <td><%= rs.getString("highest_score_player")%></td>
                <td><%= rs.getString("highest_wicket_player")%></td>
                <td><%= rs.getString("man_of_the_match")%></td>
            </tr>
            <%
                }
                con.close();
            %>
        </table>

    </body>
</html>
