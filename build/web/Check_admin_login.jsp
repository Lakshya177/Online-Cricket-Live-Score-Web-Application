<%
    String email = request.getParameter("mail");
    String pwd = request.getParameter("pwd");

// Hardcoded admin credentials
    String adminEmail = "Enter your Email";  // yahan apna email daalo
    String adminPwd = "Enter your password";             // yahan apna password daalo

    if (email != null && pwd != null && email.equalsIgnoreCase(adminEmail) && pwd.equals(adminPwd)) {
        HttpSession hs = request.getSession(true);
        hs.setAttribute("admin", email);
        response.sendRedirect("admin_home.jsp");
    } else {
        request.setAttribute("error", "Email id or password does not match");
        request.getRequestDispatcher("admin_login.jsp").forward(request, response);
    }
%>

