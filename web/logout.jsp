<%
    HttpSession hs = request.getSession(false);
    if (hs != null) {
        hs.invalidate();
    }
    response.sendRedirect("admin_login.jsp");
%>
