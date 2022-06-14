package dao;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import modelo.Menu;

public class MenuDao {
    
    Conexion conn;

    public MenuDao(Conexion conn) {
        this.conn = conn;
    }
    
    public List<Menu> getMenu(int id_usuario, int tipo) {
        String sql = "SELECT usuarios.id_usuario, usuarios.usuario, menu.id_menu, menu.nombre_modulo, menu.url \n" +
                "FROM rol_menu, menu, roles, usuarios \n" +
                "where usuarios.id_rol = roles.id_rol \n" +
                "and rol_menu.id_menu = menu.id_menu \n" +
                "and rol_menu.id_rol = roles.id_rol \n" +
                "and usuarios.id_usuario = ? \n" +
                "and menu.tipo = ?;";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, id_usuario);
            ps.setInt(2, tipo);
            ResultSet rs = ps.executeQuery();

            Menu menu;
            List<Menu> lista = new LinkedList<>();
            while (rs.next()) {
                menu = new Menu(rs.getInt("menu.id_menu"));
                menu.setNombre_modulo(rs.getString("menu.nombre_modulo"));
                menu.setUrl(rs.getString("menu.url"));
                lista.add(menu);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            return null;
        }
    }
    
    public List<Menu> selecTodo(){
        String sql = "select * from menu";
        
        try{
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<Menu> lista = new LinkedList<>();
            Menu m;
            while(rs.next()){
                m = new Menu(rs.getInt("id_menu"));
                m.setNombre_modulo(rs.getString("nombre_modulo"));
                m.setUrl(rs.getString("url"));
                m.setTipo(rs.getInt("tipo"));
                lista.add(m);
            }
            return lista;
            
        }catch(Exception e){
            System.out.println(e);
            return null;
        }
        
        
    }
    
}
