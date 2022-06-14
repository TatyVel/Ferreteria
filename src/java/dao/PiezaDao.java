package dao;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;
import modelo.Pieza;
import modelo.TipoPieza;

public class PiezaDao {
    
    Conexion conn;

    public PiezaDao(Conexion conn) {
        this.conn = conn;
    }

    public boolean insert(Pieza p) {
        String sql = "insert into pieza values(?,?,?,?,?,?,?)";
        
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            
            TipoPieza tp = p.getId_tipo();
            
            ps.setInt(1, p.getId_pieza());
            ps.setString(2, p.getTipo_pieza());
            ps.setInt(3, p.getModelo());
            ps.setDouble(4, p.getPrecio());
            ps.setString(5, p.getDescripcion());
            ps.setInt(6, p.getCantidad());
            ps.setInt(7, tp.getId_tipo());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public List<Pieza> selectAll() {
        String sql = "select * from pieza inner join tipo_pieza ON pieza.id_tipo = tipo_pieza.id_tipo";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            List<Pieza> lista = new LinkedList<>();
            Pieza p;
            while(rs.next()){
                
                TipoPieza tp = new TipoPieza(rs.getInt("id_tipo"));
                tp.setTipo_pieza(rs.getString("tipo_pieza")); //le entrego el parametro
                
                p = new Pieza(rs.getInt("id_pieza"));
                p.setTipo_pieza(rs.getString("tipo_pieza"));
                p.setModelo(rs.getInt("modelo"));
                p.setPrecio(rs.getDouble("precio"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setCantidad(rs.getInt("cantidad"));
                p.setId_tipo(tp); //se le entrega los atributos de la clase aunque nullos la mayoria, mas no el que necesitamos
                lista.add(p);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
    
    
    public boolean delete(int id){
        String sql= "delete from pieza where id_pieza=?";
        try{
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        }catch(Exception e){
            return false;
        }
        
    }
    
    
    public List<Pieza> selectById(int id){
        String sql = "select * from pieza where id_pieza = ? ";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            List<Pieza> lista = new LinkedList<>();
            Pieza p;
            while(rs.next()){
                
                TipoPieza tp = new TipoPieza(rs.getInt("id_tipo"));
                
                p = new Pieza(rs.getInt("id_pieza"));
                
                p.setTipo_pieza(rs.getString("tipo_pieza"));
                p.setModelo(rs.getInt("modelo"));
                p.setPrecio(rs.getDouble("precio"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setCantidad(rs.getInt("cantidad"));
                p.setId_tipo(tp);
                lista.add(p);
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
    
    
    public boolean update(Pieza p){
         String sql = "update pieza set tipo_pieza=?, modelo =?, precio =?, descripcion =?, cantidad =?, id_tipo =? where id_pieza=?";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            TipoPieza tp = p.getId_tipo();
            
            ps.setString(1, p.getTipo_pieza());
            ps.setInt(2, p.getModelo());
            ps.setDouble(3, p.getPrecio());
            ps.setString(4, p.getDescripcion());
            ps.setInt(5, p.getCantidad());
            ps.setInt(6, tp.getId_tipo());
            ps.setInt(7, p.getId_pieza());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    
    }
    
    
    
}
