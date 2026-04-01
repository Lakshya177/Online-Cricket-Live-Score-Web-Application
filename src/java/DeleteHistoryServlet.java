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

@WebServlet("/DeleteHistoryServlet")
public class DeleteHistoryServlet extends HttpServlet 
{

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

try {
     int id = Integer.parseInt(request.getParameter("id"));
     //Load the Driver
     Class.forName("com.mysql.cj.jdbc.Driver");
     
     //Make the connection object
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricketdb","root","root");
     
     //Make preparedstatement object
     PreparedStatement ps = con.prepareStatement("DELETE FROM history_match WHERE match_id=?");
     ps.setInt(1, id);
     ps.executeUpdate();
     con.close();

     response.sendRedirect("ShowHistoryMatches.jsp");
     } 
       catch(Exception e) 
      {
        e.printStackTrace();
      }
      }
}

