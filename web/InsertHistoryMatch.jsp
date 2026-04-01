<%@ page import="java.sql.*" %>
<%
    String matchDate = request.getParameter("matchDate");
    String team1 = request.getParameter("team1");
    String team2 = request.getParameter("team2");
    String winningTeam = request.getParameter("winningTeam");
    int highestScore = Integer.parseInt(request.getParameter("highestScore"));
    int highestWicket = Integer.parseInt(request.getParameter("highestWicket"));
    String hsPlayer = request.getParameter("hsPlayer");
    String hwPlayer = request.getParameter("hwPlayer");
    String manOfMatch = request.getParameter("manOfMatch");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/cricketdb", "root", "root");

    String sql = "INSERT INTO history_match(match_date, team1, team2, winning_team, "
            + "highest_score, highest_wicket, highest_score_player, highest_wicket_player, man_of_the_match) "
            + "VALUES(?,?,?,?,?,?,?,?,?)";

    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, matchDate);
    ps.setString(2, team1);
    ps.setString(3, team2);
    ps.setString(4, winningTeam);
    ps.setInt(5, highestScore);
    ps.setInt(6, highestWicket);
    ps.setString(7, hsPlayer);
    ps.setString(8, hwPlayer);
    ps.setString(9, manOfMatch);

    ps.executeUpdate();
    con.close();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>History Match Inserted</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f2f2f2;
                margin: 0;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative;
            }

            /* HOME BUTTON TOP-RIGHT */
            .home-btn {
                position: absolute;
                top: 20px;
                right: 20px;
                padding: 10px 20px;
                background: red;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }

            .home-btn:hover {
                opacity: 0.9;
            }

            .message-box {
                padding: 30px 40px;
                text-align: center;
            }

            .message-box h2 {
                color: #28a745;
                margin: 0;
            }
        </style>
    </head>
    <body>

        <a href="admin_home.jsp" class="home-btn">Home</a>

        <div class="message-box">
            <h2>History Match Inserted Successfully!</h2>
        </div>

    </body>
</html>
