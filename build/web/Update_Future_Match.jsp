<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("matchId"));
    String date = request.getParameter("matchDate");
    String time = request.getParameter("matchTime");
    String team1 = request.getParameter("team1");
    String team2 = request.getParameter("team2");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricketdb", "root", "root");

        String sql = "UPDATE Future_Match SET Match_Date=?, Match_Start_Time=?, MatchTeam1=?, MatchTeam2=? WHERE Match_id=?";
        ps = con.prepareStatement(sql);

        ps.setString(1, date);
        ps.setString(2, time);
        ps.setString(3, team1);
        ps.setString(4, team2);
        ps.setInt(5, id);

        ps.executeUpdate();

        response.sendRedirect("Show_Future_Matches.jsp");

    } catch (Exception e) {
        out.println(e);
    } finally {
        if (ps != null) {
            ps.close();
        }
        if (con != null) {
            con.close();
        }
    }
%>
