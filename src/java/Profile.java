/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/Profile"})
public class Profile extends HttpServlet {

 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
 {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
       
     HttpSession hs=request.getSession(false);
       if(hs!=null)
        {
          String name=(String)hs.getAttribute("naam");
          String mail=(String)hs.getAttribute("email");
          String mob=(String)hs.getAttribute("mobile");
          
out.println("<!DOCTYPE html>");
out.println("<html>");
out.println("<head>");
out.println("<title>Profile</title>");
out.println("<style>");
out.println("body{font-family:'Segoe UI',sans-serif; margin:0; background:#f3f4f6;}");

out.println(".navbar{display:flex; justify-content:flex-end; align-items:center; "
        + "padding:15px 50px; background:#1f2937;}");

out.println(".navbar a{color:white; text-decoration:none; margin-left:20px; "
        + "font-weight:500;}");

out.println(".container{max-width:900px; margin:50px auto; background:white; "
        + "padding:30px; border-radius:12px; box-shadow:0 8px 20px rgba(0,0,0,0.1);} ");

out.println("h2{text-align:center; color:#111827;}");

out.println("table{width:100%; border-collapse:collapse; margin-top:25px;}");

out.println("th{background:#2563eb; color:white; padding:12px;}");

out.println("td{padding:12px; text-align:center; border-bottom:1px solid #e5e7eb;}");

out.println("tr:hover{background:#f3f4f6;}");

out.println(".action img{transition:0.3s;}");

out.println(".action img:hover{transform:scale(1.1);} ");

out.println(".logout-btn{display:inline-block; margin-top:20px; padding:10px 18px; "
        + "background:#dc2626; color:white; text-decoration:none; border-radius:6px; font-weight:500;}");

out.println(".logout-btn:hover{background:#b91c1c;}");

out.println("</style>");
out.println("</head>");
out.println("<body>");

out.println("<div class='navbar'>");
out.println("<div>");
out.println("<a href='Home'>Home</a>");
out.println("<a href='Logout'>Logout</a>");
out.println("</div>");
out.println("</div>");


out.println("<div class='container'>");
out.println("<h2>Welcome to Your Profile</h2>");

out.println("<table>");
out.println("<tr>");
out.println("<th>Name</th>");
out.println("<th>Email</th>");
out.println("<th>Mobile</th>");
out.println("<th>Edit</th>");
out.println("<th>Delete</th>");
out.println("</tr>");

out.println("<tr>");
out.println("<td>" + name + "</td>");
out.println("<td>" + mail + "</td>");
out.println("<td>" + mob + "</td>");

out.println("<td class='action'><a href='edit.jsp?rolll=" + mail + "'>");
out.println("<img src='image/edit.png' height='32' width='32'></a></td>");

out.println("<td class='action'><a href='delete.jsp?rolll=" + mail + "'>");
out.println("<img src='image/delete.png' height='32' width='32'></a></td>");
out.println("</tr>");
out.println("</table>");

out.println("</div>");
out.println("</body>");
out.println("</html>");

        }
        else
        {
            //out.println("<h2>Please Login First</h2>");
            RequestDispatcher rd=request.getRequestDispatcher("Home2.html");
            rd.include(request, response);
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
