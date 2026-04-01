<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Future Match</title>

        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            }

            .container {
                width: 450px;
                margin: 80px auto;
                background: #ffffff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 15px 30px rgba(0,0,0,0.3);
            }

            h2 {
                text-align: center;
                color: #203a43;
                margin-bottom: 25px;
            }

            label {
                font-weight: bold;
                display: block;
                margin-top: 15px;
            }

            input {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border-radius: 6px;
                border: 1px solid #ccc;
                transition: 0.3s;
            }

            input:focus {
                border-color: #2c5364;
                outline: none;
                box-shadow: 0 0 5px rgba(44,83,100,0.5);
            }

            .btn {
                width: 100%;
                margin-top: 25px;
                padding: 10px;
                background-color: #203a43;
                color: white;
                border: none;
                border-radius: 6px;
                font-size: 16px;
                cursor: pointer;
                transition: 0.3s;
            }

            .btn:hover {
                background-color: #162a30;
            }
        </style>
    </head>

    <body>

        <%
            int id = Integer.parseInt(request.getParameter("id"));

            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/cricketdb", "root", "root");

                String sql = "SELECT * FROM Future_Match WHERE Match_id=?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                rs = ps.executeQuery();

                if (rs.next()) {
        %>

        <div class="container">

            <h2>Edit Future Match</h2>

            <form action="Update_Future_Match.jsp" method="post">

                <input type="hidden" name="matchId"
                       value="<%= rs.getInt("Match_id")%>">

                <label>Match Date</label>
                <input type="date" name="matchDate"
                       value="<%= rs.getDate("Match_Date")%>" required>

                <label>Match Start Time</label>
                <input type="time" name="matchTime"
                       value="<%= rs.getString("Match_Start_Time")%>" required>

                <label>Team 1</label>
                <input type="text" name="team1"
                       value="<%= rs.getString("MatchTeam1")%>" required>

                <label>Team 2</label>
                <input type="text" name="team2"
                       value="<%= rs.getString("MatchTeam2")%>" required>

                <input type="submit" value="Update Match" class="btn">

            </form>

        </div>

        <%
                }
            } catch (Exception e) {
                out.println(e);
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

    </body>
</html>

