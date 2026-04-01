<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Match History</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                background: linear-gradient(135deg, #1e3c72, #2a5298);
                margin: 0;
                padding: 0;
            }

            .container {
                width: 500px;
                margin: 60px auto;
                background: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.3);
            }

            h2 {
                text-align: center;
                color: #1e3c72;
                margin-bottom: 25px;
            }

            label {
                font-weight: bold;
                display: block;
                margin-top: 10px;
            }

            input {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            input:focus {
                border-color: #2a5298;
                outline: none;
            }

            button {
                width: 100%;
                margin-top: 20px;
                padding: 10px;
                background-color: #1e3c72;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }

            button:hover {
                background-color: #16325c;
            }
        </style>
    </head>

    <body>

        <%
            String id = request.getParameter("id");

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cricketdb", "root", "root");

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM history_match WHERE match_id=?");

            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
        %>

        <div class="container">

            <h2>Edit Match History</h2>

            <form action="UpdateHistoryServlet" method="post">

                <input type="hidden" name="id" value="<%= rs.getInt("match_id")%>"/>

                <label>Match Date</label>
                <input type="date" name="match_date"
                       value="<%= rs.getDate("match_date")%>"/>

                <label>Team 1</label>
                <input type="text" name="team1"
                       value="<%= rs.getString("team1")%>"/>

                <label>Team 2</label>
                <input type="text" name="team2"
                       value="<%= rs.getString("team2")%>"/>

                <label>Winning Team</label>
                <input type="text" name="winning_team"
                       value="<%= rs.getString("winning_team")%>"/>

                <label>Highest Score</label>
                <input type="number" name="highest_score"
                       value="<%= rs.getInt("highest_score")%>"/>

                <label>Highest Wicket</label>
                <input type="number" name="highest_wicket"
                       value="<%= rs.getInt("highest_wicket")%>"/>

                <label>Highest Score Player</label>
                <input type="text" name="highest_score_player"
                       value="<%= rs.getString("highest_score_player")%>"/>

                <label>Highest Wicket Player</label>
                <input type="text" name="highest_wicket_player"
                       value="<%= rs.getString("highest_wicket_player")%>"/>

                <label>Man of the Match</label>
                <input type="text" name="man_of_the_match"
                       value="<%= rs.getString("man_of_the_match")%>"/>

                <button type="submit">Update Match</button>

            </form>

        </div>

        <%
            }
            rs.close();
            ps.close();
            con.close();
        %>

    </body>
</html>
