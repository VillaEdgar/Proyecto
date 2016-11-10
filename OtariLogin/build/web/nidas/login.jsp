
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="java.sql.*, java.io.*"%>
<%
    if (request.getParameter("ok") != null) {
        

        String usuario;
        String contra;
        
        Connection c = null;
        Statement s = null;
        ResultSet r = null;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/otariB", "root", "n0m3l0");
            s = c.createStatement();
        } catch (SQLException error) {
            out.print(error.toString());
        }
        String id = " ";
        try {
            usuario = request.getParameter("usuario");
            contra = request.getParameter("contraseña");
            r = s.executeQuery("select * from Usuarios where nombreusuario ='" + usuario + "';");
            if (r.next()) {
                String con = r.getString("contra");
                 id = r.getString("idusuario");
                if (contra.equals(con)) {
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("usuari", request.getParameter("usuario"));
                    sesion.setAttribute("contra", request.getParameter("contraseña"));

                    out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Otari/Web/nidas/principal.jsp'/>");
                } else {
                    out.println("<script>alert('Contraseña incorrecta')</script>");
                    out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001;URL=http://localhost:8080/Otari/Web/'/>");
                }
            } else {
                out.println("<script>alert('Usuario no existe')</script>");
                out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001;URL=http://localhost:8080/Otari/Web/'/>");
            }
        } catch (SQLException error) {
            out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001;URL=http://localhost:8080/Otari/Web/'/>");
        }
    }
%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesión.</title>
        <link rel="stylesheet" type="text/css" href="css/Registro.css">
    </head>
    <body>

    </body>
</html>
