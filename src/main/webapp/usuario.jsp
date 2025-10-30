<%-- 
    Document   : usuario
    Created on : 30/10/2025, 5:16:24 p. m.
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
        <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Usuarios</title>
</head>
<body>
    <h2>Usuarios Registrados</h2>

    <%
        String url = "jdbc:mysql://localhost:3306/web_login";
        String username = "root";
        String passworddb = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, passworddb);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM usuarios");

            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Correo</th></tr>");

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id") + "</td>");
                out.println("<td>" + rs.getString("correo") + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");
            conn.close();
        } catch (Exception e) {
            out.println("<p>Error al consultar usuarios: " + e.getMessage() + "</p>");
        }
    %>

    <a href="home.jsp">Volver al inicio</a>
</body>
</html>

    </body>
</html>
