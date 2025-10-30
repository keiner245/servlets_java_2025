/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tuyweb.web_login;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Register extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

 
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

      String url = "jdbc:mysql://localhost:3306/web_login?useSSL=false&serverTimezone=UTC";
        String username = "root";
        String passworddb = "";
       
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            Connection conn = DriverManager.getConnection(url, username, passworddb);
            Statement stmt = conn.createStatement();

            int rowsInserted = stmt.executeUpdate("INSERT INTO usuarios (correo,clave) VALUES ('"+email+"','"+password+"')");

            if (rowsInserted > 0) {
                
                HttpSession session = request.getSession(true);
                session.setAttribute("usuarioEmail", email);
                session.setMaxInactiveInterval(30 * 60);
                
                response.sendRedirect("home.jsp");
            } else {
                response.sendRedirect("/");
            }

        } catch (SQLException ex) {
            response.setContentType("text/html;charset=UTF-8");
             try (PrintWriter out = response.getWriter()) {
                    out.println("<html><body>");
                    out.println("<h2>Error</h2>");
                    out.println("<P>En base de datos</p>");
                    out.println(ex.getSQLState());
                    out.println("</body></html>");
                }
        }

    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
