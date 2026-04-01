<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricketdb", "root", "root");

        String sql = "DELETE FROM Future_Match WHERE Match_id=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();

        response.sendRedirect("Show_Future_Matches.jsp");

    } catch (Exception e) {
        out.println(e);
    } finally {
        if (ps != null) {
            ps.close();
        }
        if (con != null) {
            con.close();
        }
    }
%>
