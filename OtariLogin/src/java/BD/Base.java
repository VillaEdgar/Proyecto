/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

/**
 *
 * @author EdgarAntonio
 */
import java.sql.*;

public class Base {
    
    private String nombre;
    private String contra;
    private String url;
    private String driver;
    private Connection con=null;
    private Statement es;
    
    public Base(String nombre, String contra, String url, String driver){
        this.nombre=nombre;
        this.contra=contra;
        this.url=url;
        this.driver=driver;
    }
    
    public Base(){
        this.nombre="root";
        this.contra="a1b2c3d45f6";
        this.url="jdbc:mysql://127.0.0.1:3306/otari";
        this.driver="com.mysql.jdbc.Driver";
    }
    
    public void setUsuarioBD(String usuario) throws SQLException{
        this.nombre=usuario;
    }
    public void setPassBD(String pass) {
        this.contra = pass;
    } 
    public void setUrlBD(String url) {
        this.url = url;
    }
    public void setConn(Connection conn) {
        this.con = conn;
    }
    public void setDriverClassName(String driverClassName) {
        this.driver = driverClassName;
    }
    
    //Conexion a la BD
    public void conectar() throws SQLException {
        try {
            Class.forName(this.driver).newInstance();
            this.con = DriverManager.getConnection(this.url, this.nombre, this.contra);
 
        } catch (Exception err) {
            System.out.println("Error " + err.getMessage());
        }
    }
    
    public int insertar(String inserta) throws SQLException {
        Statement st = (Statement) this.con.createStatement();
        return st.executeUpdate(inserta);
    }
}
