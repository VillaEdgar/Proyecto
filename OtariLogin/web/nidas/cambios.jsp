<%-- 
    Document   : cambios
    Created on : 10/11/2016, 08:00:24 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page  import="java.sql.*, java.io.*" %>
<%
    String nomb;
    Connection c=null;
    Statement s=null;
    ResultSet r=null;
    
    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        c=DriverManager.getConnection("jdbc:mysql://localhost:3306/otariB","root","n0,3l0");
        s=c.createStatement();
    } catch(SQLException error){
        out.print(error.toString());
    }
    
    try{
        nomb = request.getParameter("nombre");
        r= s.executeQuery("select * from Usuario where nombre='"+nomb+"';");
        
        if(r.next()){
            String con=r.getString("contra");
            String con2=r.getString("contra");
            String nom = nomb;
            int edad = r.getInt("edad");
            String direc=r.getString("direccion");
            String contra=r.getString("contra");
            String correo=r.getString("correo");

        }else{
            out.println("<script>alert('no existe el usuario')</script>"
                    + "<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/Otari/cambios.html'/>");
        }
    } catch(SQLException error){
        out.print(error.toString());
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
