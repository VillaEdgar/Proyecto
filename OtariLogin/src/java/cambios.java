/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alumno
 */
public class cambios extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String nomb;
            Connection c = null;
            Statement s = null;
            ResultSet r = null;

            try {
               // Class.forName("com.mysql.jdbc.Driver").newInstance();
                c = DriverManager.getConnection("jdbc:mysql://localhost:3306/otariB", "root", "n0,3l0");
                s = c.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
           // } catch (ClassNotFoundException ex) {
             //   Logger.getLogger(cambios.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                nomb = request.getParameter("nombre");
                r = s.executeQuery("select * from Usuario where nombre='" + nomb + "';");

                if (r.next()) {
                    String con = r.getString("contra");
                    String con2 = r.getString("contra");
                    String nom = nomb;
                    int edad = r.getInt("edad");
                    String direc = r.getString("direccion");
                    String contra = r.getString("contra");
                    String correo = r.getString("correo");
                    
                    out.println("<h1>Cambios<h1>"
                            + "<form action=''>"
                            + "Nombre:"
                            + "<input type='text' name='contra' value='"+con+"'>"
                            + "<input type='text' name='contra2' value='"+con2+"' style='display:none'>"
                            + "String nom"
                            + "</form>");
                } else {
                    out.println("<script>alert('no existe el usuario')</script>"
                            + "<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/Otari/cambios.html'/>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }
        }
    }
}
