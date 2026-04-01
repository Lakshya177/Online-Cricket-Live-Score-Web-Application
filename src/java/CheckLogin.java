
import jakarta.servlet.RequestDispatcher;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/CheckLogin")
public class CheckLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        PrintWriter out = resp.getWriter();

        try {
            String email = req.getParameter("mail");
            String pwd = req.getParameter("pwd");

            //load the driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            //make the connection object
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricketdb", "root", "root");

            //make preparedstatement object
            PreparedStatement ps = cn.prepareStatement("select * from audience where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, pwd);

            //execute the query
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String mail = rs.getString("email");
                String mobile = rs.getString("mobile");

                HttpSession hs = req.getSession(true);
                hs.setAttribute("naam", name);
                hs.setAttribute("email", mail);
                hs.setAttribute("mobile", mobile);

                //RequestDispatcher rd=req.getRequestDispatcher("Home");
                //rd.forward(req, resp);
                //resp.sendRedirect("Video.jsp");
                resp.sendRedirect("Home");

            } else {
                //out.println("<h2>Email or password not match</h2>");
                RequestDispatcher rd = req.getRequestDispatcher("Login.html");
                rd.include(req, resp);
            }
            cn.close();
        } catch (Exception ex) {
            out.println(ex.toString());
        }
    }
}
