
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet(urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("mail");
        String mobile = request.getParameter("mob");
        String pwd = request.getParameter("pwd");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricketdb", "root", "root");

            // Check if email already exists
            PreparedStatement psCheck = cn.prepareStatement("SELECT * FROM audience WHERE email = ?");
            psCheck.setString(1, email);
            ResultSet rs = psCheck.executeQuery();

            if (rs.next()) {
                // Email already registered
                // out.println("<h3 style='color:red; text-align:center;'>Email already registered! Please login.</h3>");
                RequestDispatcher rd = request.getRequestDispatcher("Registers2.html");
                rd.include(request, response);
            } else {
                // Insert new record
                PreparedStatement ps = cn.prepareStatement("INSERT INTO audience (name, email, mobile, password) VALUES (?, ?, ?, ?)");
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, mobile);
                ps.setString(4, pwd);

                int rowsInserted = ps.executeUpdate();
                if (rowsInserted > 0) {
                    RequestDispatcher rd = request.getRequestDispatcher("Registers.html");
                    rd.include(request, response);
                }
            }

            cn.close();
        } catch (Exception ex) {
            out.println("<h3 style='color:red; text-align:center;'>Error: " + ex.getMessage() + "</h3>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
