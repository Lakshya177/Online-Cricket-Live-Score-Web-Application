import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/Home"})
public class Home extends HttpServlet {

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException
     {
        processRequest(request, response);
     }
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException 
    {
       processRequest(request, response);
    }

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession hs = request.getSession(false);

        if (hs != null && hs.getAttribute("naam") != null) {

            String name = (String) hs.getAttribute("naam");

            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Home</title>");
            out.println("<style>");

            // BODY
            out.println("body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; "
                    + "margin:0; padding:0; background: linear-gradient(135deg, #f5f7fa, #c3cfe2); }");

            // NAVBAR
            out.println(".navbar { display:flex; justify-content: space-between; align-items:center; "
                    + "padding:15px 60px; background: #1f2933; color:white; }");

            out.println(".nav-links { display:flex; gap: 20px; }");
            out.println(".nav-links a { color:white; text-decoration:none; font-weight:500; "
                    + "padding: 6px 12px; border-radius: 6px; }");
            out.println(".nav-links a:hover { background:#1abc9c; color:black; }");

            // CARD CONTAINER
            out.println(".container { max-width: 650px; margin: 80px auto; "
                    + "background:white; padding:40px 30px; border-radius:15px; "
                    + "border: 2px solid #1abc9c; box-shadow: 0 8px 20px rgba(0,0,0,0.15); "
                    + "text-align:center; }");

            out.println("h2 { color: #34495e; margin-bottom: 10px; font-size:28px; }");
            out.println("span { font-size:18px; color:#7f8c8d; display:block; margin-bottom:30px; }");

             
            out.println(".btn { display:inline-block; padding:12px 25px; margin:10px; "
                        + "background:#1abc9c; color:white; text-decoration:none; border-radius:6px; "
                        + "font-weight:500; }");
            out.println(".btn:hover { background:#16a085; }");

            out.println("</style>");
            out.println("</head>");
            out.println("<body>");

            
            out.println("<div class='navbar'>");
            out.println("<div><strong>My Dashboard</strong></div>");
            out.println("<div class='nav-links'>");
            out.println("<a href='Home'>Home</a>");
            out.println("<a href='Profile'>Profile</a>");
            out.println("<a href='Logout'>Logout</a>");
            out.println("</div>");
            out.println("</div>");

             RequestDispatcher rd=request.getRequestDispatcher("Video.jsp");
            rd.include(request, response);
            out.println("<div class='container'>");
            out.println("<h2>Welcome</h2>");
            out.println("<span>" + name + "</span>");
            out.println("<a href='audience_upcoming_matches.jsp' class='btn'>Show Upcoming Matches</a>");
            out.println("<a href='ShowHistoryMatches2.jsp' class='btn'>View History Matches</a>");
            out.println("</div>");

           
            out.println("</body>");
            out.println("</html>");

        } 
        else 
        {
            response.sendRedirect("Home2.html");
        }
    }
}
