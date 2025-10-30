<%-- 
    Document   : home
    Created on : 30/10/2025, 5:09:13 p. m.
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                <%
            HttpSession ses = request.getSession(false);
            if (ses == null || ses.getAttribute("usuarioEmail") == null) {
                response.sendRedirect("index.jsp");
                return;
            }
            String email = (String) ses.getAttribute("usuarioEmail");
         %>
            
            Bienvenido <%= email %>
            
            <a href="usuario.jsp">ver usuario</a>
             <a href="logout.jsp">cerrar sesion</a>
            
            
    </body>
</html>
