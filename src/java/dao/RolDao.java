package dao;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import modelo.Rol;

public class RolDao {
    Conexion conn;

    public RolDao(Conexion conn) {
        this.conn = conn;
    }
    
    public List<Rol> getAllRoles() {
        String sql = "select * from roles";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            Rol rol;
            List<Rol> lista = new LinkedList<>();
            while (rs.next()) {
                rol = new Rol(rs.getInt("id_rol"));
                rol.setNombre_rol(rs.getString("nombre_rol"));
                rol.setCrear(rs.getString("crear"));
                rol.setActualizar(rs.getString("actualizar"));
                rol.setEliminar(rs.getString("eliminar"));
                
                lista.add(rol);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            return null;
        }
    }
    
    public boolean insert(Rol r) {
        String sql = "insert into roles values(?,?,?,?,?)";
        
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
                        
            ps.setInt(1, r.getId_rol());
            ps.setString(2, r.getNombre_rol());
            ps.setString(3, r.getCrear());
            ps.setString(4, r.getActualizar());
            ps.setString(5, r.getEliminar());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean delete(int id){
        String sql= "delete from roles where id_rol=?";
        try{
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        }catch(Exception e){
            return false;
        }
        
    }
    
    
    public List<Rol> selectById(int id){
        String sql = "select * from roles where id_rol = ? ";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            List<Rol> lista = new LinkedList<>();
            Rol rol;
            while(rs.next()){
                
                rol = new Rol(rs.getInt("id_rol"));
                rol.setNombre_rol(rs.getString("nombre_rol"));
                rol.setCrear(rs.getString("crear"));
                rol.setActualizar(rs.getString("actualizar"));
                rol.setEliminar(rs.getString("eliminar"));
                lista.add(rol);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
    
    
    public boolean update(Rol r) {
        String sql = "update roles set nombre_rol = ?, crear = ?, actualizar = ?, eliminar = ? where id_rol = ?";
        
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
                        
            ps.setString(1, r.getNombre_rol());
            ps.setString(2, r.getCrear());
            ps.setString(3, r.getActualizar());
            ps.setString(4, r.getEliminar());
            ps.setInt(5, r.getId_rol());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
