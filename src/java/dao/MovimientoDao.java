package dao;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import modelo.Almacen;
import modelo.Movimiento;
import modelo.Pieza;
import modelo.Usuario;

public class MovimientoDao {

    Conexion conn;

    public MovimientoDao(Conexion conn) {
        this.conn = conn;
    }

    public List<Movimiento> selectAll() {
        String sql = "SELECT * FROM movimientos \n"
                + "INNER JOIN almacen ON movimientos.id_almacen = almacen.id_almacen \n"
                + "INNER JOIN pieza ON movimientos.id_pieza = pieza.id_pieza "
                + "INNER JOIN usuarios ON movimientos.id_usuario = usuarios.id_usuario";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            List<Movimiento> lista = new LinkedList<>();
            Movimiento mv;

            while (rs.next()) {
                Pieza p = new Pieza(rs.getInt("pieza.id_pieza"));
                p.setTipo_pieza(rs.getString("pieza.tipo_pieza"));
                p.setModelo(rs.getInt("pieza.modelo"));
                p.setDescripcion(rs.getString("pieza.descripcion"));
                p.setCantidad(rs.getInt("pieza.cantidad"));

                Almacen a = new Almacen(rs.getInt("almacen.id_almacen"));
                a.setNum_almacen(rs.getInt("almacen.num_almacen"));
                a.setDescripcion(rs.getString("almacen.descripcion"));
                a.setNombre_estanteria(rs.getString("almacen.nombre_estanteria"));
                
                Usuario u = new Usuario(rs.getInt("usuarios.id_usuario"));
                u.setUsuario(rs.getString("usuarios.usuario"));

                mv = new Movimiento(rs.getInt("id_movimientos"));
                mv.setId_pieza(p);
                mv.setId_almacen(a);
                mv.setId_usuario(u);

                lista.add(mv);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            return null;
        }
    }

    public boolean insertMovimiento(Movimiento mo) {
        String sql = "insert into movimientos values(?,?,?,?)";

        try {

            PreparedStatement ps = conn.conectar().prepareCall(sql);
            Pieza p = mo.getId_pieza();
            Almacen al = mo.getId_almacen();
            Usuario u = mo.getId_usuario();

            ps.setInt(1, mo.getId_movimientos());
            ps.setInt(2, p.getId_pieza());
            ps.setInt(3, al.getId_almacen());
            ps.setInt(4, u.getId_usuario());

            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public List<Movimiento> selectAllById(int id_movimientos) {
        String sql = "SELECT * FROM movimientos where id_movimientos=?";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, id_movimientos);
            ResultSet rs = ps.executeQuery();
            List<Movimiento> lista = new LinkedList<>();
            Movimiento mv;

            while (rs.next()) {
                mv = new Movimiento(rs.getInt("id_movimientos"));
                Pieza p = new Pieza(rs.getInt("id_pieza"));
                Almacen a = new Almacen(rs.getInt("id_almacen"));

                mv.setId_pieza(p);
                mv.setId_almacen(a);

                lista.add(mv);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            return null;
        }
    }

    public boolean update(Movimiento mo) {
        String sql = "update movimientos set id_pieza=?, id_almacen=?, id_usuario=? where id_movimientos=?";

        try {

            PreparedStatement ps = conn.conectar().prepareCall(sql);
            Pieza p = mo.getId_pieza();
            Almacen al = mo.getId_almacen();
            Usuario u = mo.getId_usuario();

            ps.setInt(1, p.getId_pieza());
            ps.setInt(2, al.getId_almacen());
            ps.setInt(3, u.getId_usuario());
            ps.setInt(4, mo.getId_movimientos());
            

            ps.executeUpdate();

            return true;

        } catch (Exception e) {
            System.out.println("aaaaa" + e);
            return false;
        }

    }

    public boolean delete(int id_movimientos) {
        String sql = "delete from movimientos where id_movimientos=?";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, id_movimientos);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }

    }

}
