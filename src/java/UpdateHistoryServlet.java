/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateHistoryServlet")
public class UpdateHistoryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cricketdb", "root", "root");

            String sql = "UPDATE history_match SET match_date=?, team1=?, team2=?, "
                    + "winning_team=?, highest_score=?, highest_wicket=?, "
                    + "highest_score_player=?, highest_wicket_player=?, man_of_the_match=? "
                    + "WHERE match_id=?";   // corrected column name

            ps = con.prepareStatement(sql);

            ps.setDate(1, java.sql.Date.valueOf(request.getParameter("match_date")));
            ps.setString(2, request.getParameter("team1"));
            ps.setString(3, request.getParameter("team2"));
            ps.setString(4, request.getParameter("winning_team"));
            ps.setInt(5, Integer.parseInt(request.getParameter("highest_score")));
            ps.setInt(6, Integer.parseInt(request.getParameter("highest_wicket")));
            ps.setString(7, request.getParameter("highest_score_player"));
            ps.setString(8, request.getParameter("highest_wicket_player"));
            ps.setString(9, request.getParameter("man_of_the_match"));
            ps.setInt(10, Integer.parseInt(request.getParameter("id")));

            ps.executeUpdate();

            response.sendRedirect("ShowHistoryMatches.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
