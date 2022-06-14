package dao;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import modelo.Permiso;

import modelo.Almacen;
import modelo.Menu;
import modelo.Movimiento;
import modelo.Pieza;
import modelo.Rol;
import modelo.Usuario;

public class PermisoDao {

    Conexion conn;

    public PermisoDao(Conexion conn) {
        this.conn = conn;
    }

    public List<Permiso> selectAll() {
        String sql = "SELECT * FROM rol_menu\n"
                + "INNER JOIN roles ON rol_menu.id_rol = roles.id_rol\n"
                + "INNER JOIN menu ON rol_menu.id_menu = menu.id_menu ";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            List<Permiso> lista = new LinkedList<>();
            Permiso p;

            while (rs.next()) {
                Rol r = new Rol(rs.getInt("roles.id_rol"));
                r.setNombre_rol(rs.getString("roles.nombre_rol"));

                Menu m = new Menu(rs.getInt("menu.id_menu"));
                m.setNombre_modulo(rs.getString("menu.nombre_modulo"));

                p = new Permiso(rs.getInt("id_rol_menu"));
                p.setId_rol(r);
                p.setId_menu(m);

                lista.add(p);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            return null;
        }
    }

    public boolean insertPermiso(Permiso pe) {
        String sql = "insert into rol_menu values(?,?,?)";

        try {

            PreparedStatement ps = conn.conectar().prepareCall(sql);
            Rol r = pe.getId_rol();
            Menu m = pe.getId_menu();

            ps.setInt(1, pe.getId_rol_menu());
            ps.setInt(2, r.getId_rol());
            ps.setInt(3, m.getId_menu());

            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public List<Permiso> selectAllById(int id_rol_menu) {
        String sql = "SELECT * FROM rol_menu where id_rol_menu=?";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, id_rol_menu);
            ResultSet rs = ps.executeQuery();
            List<Permiso> lista = new LinkedList<>();
            Permiso pe;

            while (rs.next()) {
                pe = new Permiso(rs.getInt("id_rol_menu"));
                Rol r = new Rol(rs.getInt("id_rol"));
                Menu m = new Menu(rs.getInt("id_menu"));

                pe.setId_rol(r);
                pe.setId_menu(m);

                lista.add(pe);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            return null;
        }
    }

    public boolean update(Permiso pe) {
        String sql = "update rol_menu set id_rol=?, id_menu=? where id_rol_menu=?";

        try {

            PreparedStatement ps = conn.conectar().prepareCall(sql);
            Rol r = pe.getId_rol();
            Menu m = pe.getId_menu();

            ps.setInt(1, r.getId_rol());
            ps.setInt(2, m.getId_menu());
            ps.setInt(3, pe.getId_rol_menu());

            ps.executeUpdate();

            return true;

        } catch (Exception e) {
            System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAASSSasasasasasasasas" + e);
            return false;
        }

    }

    public boolean delete(int id_rol_menu) {
        String sql = "delete from rol_menu where id_rol_menu=?";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, id_rol_menu);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }

    }

}
