package dao;

import conexion.Conexion;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import modelo.TipoPieza;

public class TipoPiezaDao {

    Conexion conn;

    public TipoPiezaDao(Conexion conn) {
        this.conn = conn;
    }

    public boolean insert(TipoPieza tp) {
        String sql = "insert into tipo_pieza values(?,?,?)";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, tp.getId_tipo());
            ps.setString(2, tp.getTipo_pieza());
            ps.setString(3, tp.getDescripcion());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public List<TipoPieza> selectAll() {
        String sql = "select * from tipo_pieza";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            List<TipoPieza> lista = new LinkedList<>();
            TipoPieza tp;
            while(rs.next()){
                tp = new TipoPieza(rs.getInt("id_tipo"));
                tp.setTipo_pieza(rs.getString("tipo_pieza"));
                tp.setDescripcion(rs.getString("descripcion"));
                lista.add(tp);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
    
    
    public boolean Eliminar(int id){
        String sql= "delete from tipo_pieza where id_tipo=?";
        try{
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        }catch(Exception e){
            return false;
        }
        
    }
    
    
    public List<TipoPieza> selectById(int id){
        String sql = "select * from tipo_pieza where id_tipo = ? ";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            List<TipoPieza> lista = new LinkedList<>();
            TipoPieza tp;
            while(rs.next()){
                tp = new TipoPieza(rs.getInt("id_tipo"));
                tp.setTipo_pieza(rs.getString("tipo_pieza"));
                tp.setDescripcion(rs.getString("descripcion"));
                lista.add(tp);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
    
    
    public boolean actualizar(TipoPieza tp){
         String sql = "update tipo_pieza set tipo_pieza=?, descripcion =? where id_tipo=?";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setString(1, tp.getTipo_pieza());
            ps.setString(2, tp.getDescripcion());
            ps.setInt(3, tp.getId_tipo());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    
    }
}
