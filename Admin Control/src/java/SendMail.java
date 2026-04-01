
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/SendMail"})
public class SendMail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String email = request.getParameter("email");
            String msg = "Click Admin panel\n\n"
                    + "http://localhost:8080/Cricket/admin_login.jsp?mailll=" + email;
            String sub = "Admin conntrol";

            Mailer.send(email, sub, msg);

            out.println("""
    <html>
    <head>
    <style>
    body{
        height:100vh;
        margin:0;
        display:flex;
        justify-content:center;
        align-items:center;
        font-family: Arial;
        background: white;
        }
                
        h1{ color:#333; }
              
        .btn{
           text-decoration:none;
           padding:8px 15px;
               border-radius:5px;
                  font-weight:bold;
                  transition:0.3s;
              }
              
              .home-btn{
                  color:blue;              }
              
              .home-btn:hover{
                  background:#00ffcc;
                  color:black;
              }
                .home-btn{
                   position: fixed;
                   top: 10px;
                   right: 10px;
                      }
                 </style>
                  </head>
                
                   <body>
                   <div class='box'>
                      <h2>Mail Send </h2>
                      <a href='index.html' class='btn home-btn'>Home page</a>
                    </body>
                
    </html>
    """);

        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
