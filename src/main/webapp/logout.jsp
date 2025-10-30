<%-- 
    Document   : logout
    Created on : 30/10/2025, 4:30:11 p. m.
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
HttpSession ses = request.getSession(false);
            if (ses == null) {
            ses.invalidate();
    }
    response.sendRedirect("index.jsp");
%>