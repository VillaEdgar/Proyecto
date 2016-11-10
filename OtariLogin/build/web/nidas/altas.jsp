
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
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/otariB","root","n0m3l0");
                String querystring = "INSERT INTO usuario(nombre,apellido,usuario,contra) VALUES(?,?,?,?)";
                pstatement = con.prepareStatement(querystring);
                pstatement.setString(1,nombre);
                pstatement.setString(2,apellidos);
                pstatement.setString(3,nombreusuario);
                pstatement.setString(4,contra);
                pstatement.executeUpdate();
                out.println("<script>alert('Registro dado de alta exitosamente.')</script>");
                out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001;URL=http://localhost:8080/Otari/Web/'/>");
            }
            catch(SQLException error)
            {
                out.print("<script>alert('El correo o el nombre de usuario ya estan registrados')</script>");
                out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001;URL=http://localhost:8080/Otari/Web/registro.html>");
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
