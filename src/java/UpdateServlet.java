import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws IOException {

String name = request.getParameter("name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");

try {
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/cricketdb", "root", "root");

PreparedStatement ps = con.prepareStatement(
"UPDATE users SET name=?, mobile=? WHERE email=?");
ps.setString(1, name);
ps.setString(2, mobile);
ps.setString(3, email);
ps.executeUpdate();

response.sendRedirect("ProfileServlet");

} catch(Exception e) {
e.printStackTrace();
}
}
}

