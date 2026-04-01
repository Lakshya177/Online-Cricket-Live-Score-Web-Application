import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FutureMatch")
public class FutureMatch extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

String matchDate = request.getParameter("matchDate");
String matchTime = request.getParameter("matchTime");
String team1 = request.getParameter("team1");
String team2 = request.getParameter("team2");

response.setContentType("text/html");
PrintWriter out = response.getWriter();

out.println("<style>");
out.println(".logout-btn {");
out.println("padding: 10px 20px;");
out.println("background-color: #e74c3c;");
out.println("color: white;");
out.println("text-decoration: none;");
out.println("border-radius: 5px;");
out.println("font-weight: bold;");
out.println("transition: 0.3s;");
out.println("}");
out.println(".logout-btn:hover {");
out.println("background-color: #c0392b;");
out.println("}");
out.println("</style>");

try {
     //Load the Driver
     Class.forName("com.mysql.cj.jdbc.Driver");
     
     //Make the connection object
     Connection con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/cricketdb", "root", "root");
     String sql = "INSERT INTO Future_Match (Match_Date, Match_Start_Time, MatchTeam1, MatchTeam2) VALUES (?, ?, ?, ?)";

     PreparedStatement ps = con.prepareStatement(sql);

     ps.setString(1, matchDate);
     ps.setString(2, matchTime);
     ps.setString(3, team1);
     ps.setString(4, team2);

     int i = ps.executeUpdate();


     if (i > 0){
                out.println("<div style='text-align:right; margin-right:20px;'>"
                            + "<a href='admin_home.jsp' "
                            + "style='display:inline-block; padding:10px 20px; background:#e74c3c; "
                            + "color:white; text-decoration:none; border-radius:5px; font-weight:bold;'>"
                            + "Home</a></div>");
                
                out.println("<h2 style='text-align:center; margin-top:250px;'>Match Inserted Successfully!</h2>");
                
                } 
                else 
                {
                    
               out.println("<div style='text-align:right; margin-right:20px;'>"
                          + "<a href='admin_home.jsp' "
                          + "style='display:inline-block; padding:10px 20px; background:#e74c3c; "
                          + "color:white; text-decoration:none; border-radius:5px; font-weight:bold;'>"
                          + "Admin Home</a></div>");
               
               out.println("<h2 style='text-align:center; margin-top:250px;'>Match Inserted Successfully!</h3>");
                }
                con.close();
                } 
                catch (Exception e) 
                {
                out.println(e);
        }
    }
}
