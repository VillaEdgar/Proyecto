<%-- 
    Document   : bajas
    Created on : 10/11/2016, 09:24:27 AM
    Author     : Alumno
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@page import="java.sql.*,java.io.*" %>
        <%
            //declaración de variables
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String nombreusuario = request.getParameter("usuario");
            String contra = request.getParameter("contra");

            Connection con = null;
            //Statement stm = null;
            PreparedStatement pstatement =  null;
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/otari","root","n0m3l0");
                String querystring = "DELETE FROM Usuario WHERE nombre ='"+ nombre + "';";
                  pstatement = con.prepareStatement(querystring);
                pstatement.executeUpdate();
                out.println("<script>alert('Usuario Eliminado.')</script>");
                out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001;URL=http://localhost:8080/Otari/Web/'/>");
            }
            catch(Exception e)
            {
                out.println(e.getLocalizedMessage());
                e.printStackTrace();
            }
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
