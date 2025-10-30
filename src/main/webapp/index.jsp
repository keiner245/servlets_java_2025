<%-- 
    Document   : index
    Created on : 30/10/2025, 3:07:12 p. m.
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
        <h2>Ingrese</h2>
        <form name="login" action="login" method="POST">
            <input type="email" name="email" placeholder="Ingresa tu correo"/>
            <input type="password" name="password" placeholder="Ingresa tu contraseña"/>
            <input type="submit" value="ingresar" name="login" />
        </form>
        
        <hr>
        <h2>Registro</h2>
        <form name="register" action="register" method="POST">
            <input type="email" name="email" placeholder="Ingresa tu correo"/>
            <input type="password" name="password" placeholder="Ingresa tu contraseña"/>
            <input type="submit" value="registrar" name="login" />
        </form>
    </body>
</html>
