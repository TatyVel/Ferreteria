
package dao;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;
import modelo.Almacen;


public class AlmacenDao {

    Conexion conn;

    public AlmacenDao(Conexion conn) {
        this.conn = conn;
    }

    public boolean InsertAlmacen(Almacen al) {
        String sql = "insert into almacen values (?,?,?,?,?)";

        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, al.getId_almacen());
            ps.setInt(2, al.getNum_almacen());
            ps.setString(3, al.getDescripcion());
            ps.setString(4, al.getDireccion());
            ps.setString(5, al.getNombre_estanteria());
            ps.executeUpdate();

            return true;

        } catch (Exception e) {
            return false;
        }

    }
    
    public List<Almacen> getAllAlmacen() {
        String sql = "select * from almacen ";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ResultSet rs = ps.executeQuery();

            Almacen al;
            List<Almacen> lista = new LinkedList<>();
            while (rs.next()) {
                al = new Almacen(rs.getInt("id_almacen"));
                al.setNum_almacen(rs.getInt("num_almacen"));
                al.setDescripcion(rs.getString("descripcion"));
                al.setDireccion(rs.getString("direccion"));
                al.setNombre_estanteria(rs.getString("nombre_estanteria"));

                lista.add(al);
            }
            return lista;
        } catch (Exception e) {
            return null;

        }

    }
    
    public boolean DeleteAlmacen(int id_almacen) {
        String sql = "delete from almacen where id_almacen=? ";

        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, id_almacen);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            return false;

        }
    }
    
      public boolean UpdateAlmacen(Almacen al) {
        String sql = "update almacen set num_almacen=? , descripcion=?, direccion=?, nombre_estanteria=? where id_almacen=?";

        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            
            ps.setInt(1, al.getNum_almacen());
            ps.setString(2, al.getDescripcion());
            ps.setString(3, al.getDireccion());
            ps.setString(4, al.getNombre_estanteria());
            ps.setInt(5, al.getId_almacen());
            
            ps.executeUpdate();

            return true;

        } catch (Exception e) {
            return false;
        }

    }
      
      public List<Almacen> getByIdAlmacen(int id_almacen) {
        String sql = "select * from almacen where id_almacen=?";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, id_almacen);
            ResultSet rs = ps.executeQuery();

            Almacen al;
            List<Almacen> lista = new LinkedList<>();
            while (rs.next()) {
                al = new Almacen(rs.getInt("id_almacen"));
                al.setNum_almacen(rs.getInt("num_almacen"));
                al.setDescripcion(rs.getString("descripcion"));
                al.setDireccion("direccion");
                al.setNombre_estanteria(rs.getString("nombre_estanteria"));

                lista.add(al);
            }
            return lista;
        } catch (Exception e) {
            return null;

        }

    }

}
