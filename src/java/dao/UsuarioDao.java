package dao;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import modelo.Rol;
import modelo.Usuario;

public class UsuarioDao {

    Conexion conn;

    public UsuarioDao(Conexion conn) {
        this.conn = conn;
    }

    public Usuario login(String usuario, String clave) {
        Usuario user;
        String sql = "select * from usuarios where usuario = ? and clave = ?";
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, clave);
            ResultSet rs = ps.executeQuery();

            if (rs.next() != false) {
                user = new Usuario(rs.getInt("id_usuario"));
                user.setUsuario(rs.getString("usuario"));
                user.setNombres(rs.getString("nombres"));
                user.setApellidos(rs.getString("apellidos"));
                user.setId_usuario(rs.getInt("id_usuario"));
                Rol rol = new Rol(rs.getInt("id_rol"));
                user.setRol(rol);
                return user;
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            return null;
        }
    }
    
    public boolean insertUser(Usuario user) {
        String sql = "INSERT INTO usuarios VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            Rol rol = user.getRol();
            
            ps.setInt(1, user.getId_usuario());
            ps.setString(2, user.getNombres());
            ps.setString(3, user.getApellidos());
            ps.setString(4, user.getUsuario());
            ps.setString(5, user.getClave());
            ps.setString(6, user.getPregunta());
            ps.setString(7, user.getRespuesta());
            ps.setInt(8, rol.getId_rol());
            
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            return false;
        }
    }

    public List<Usuario> getAllUsuarios() {
        String sql = "select usuarios.*, roles.id_rol, roles.nombre_rol from usuarios Inner join roles on roles.id_rol = usuarios.id_rol";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            Usuario usuario;
            List<Usuario> lista = new LinkedList<>();
            while (rs.next()) {
                usuario = new Usuario(rs.getInt("usuarios.id_usuario"));
                usuario.setNombres(rs.getString("usuarios.nombres"));
                usuario.setApellidos(rs.getString("usuarios.apellidos"));
                usuario.setUsuario(rs.getString("usuarios.usuario"));
                usuario.setClave(rs.getString("usuarios.clave"));
                usuario.setPregunta(rs.getString("usuarios.recovery_pregunta"));
                usuario.setRespuesta(rs.getString("usuarios.recovery_respuesta"));
                
                Rol rol = new Rol(rs.getInt("roles.id_rol"));
                rol.setId_rol(rs.getInt("roles.id_rol"));
                rol.setNombre_rol(rs.getString("roles.nombre_rol"));
                usuario.setRol(rol);

                lista.add(usuario);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            return null;
        }
    }
    
    public boolean delete(int id_usuario) {
        String sql = "delete from usuarios where id_usuario = ?";

        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, id_usuario);
            ps.executeUpdate();

            return true;
        } catch (SQLException e) {
            return false;

        }
    }

    public List<Usuario> getUsuario(int id_usuario) {
        String sql = "select * from usuarios where id_usuario = ?";
        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            ps.setInt(1, id_usuario);
            ResultSet rs = ps.executeQuery();
            Usuario usuario;
            List<Usuario> lista = new LinkedList<>();
            while (rs.next()) {
                usuario = new Usuario(rs.getInt("id_usuario"));
                usuario.setNombres(rs.getString("nombres"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setClave(rs.getString("clave"));
                usuario.setPregunta(rs.getString("recovery_pregunta"));
                usuario.setRespuesta(rs.getString("recovery_respuesta"));
                
                Rol rol = new Rol(rs.getInt("id_rol"));
                rol.setId_rol(rs.getInt("id_rol"));
                usuario.setRol(rol);

                lista.add(usuario);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            return null;
        }
    }
    
    public boolean update(Usuario user) {
        String sql = "UPDATE usuarios SET nombres = ?, apellidos = ?, usuario = ?, clave = ?, recovery_pregunta = ?, recovery_respuesta  = ?, id_rol = ? WHERE id_usuario = ?";

        try {
            PreparedStatement ps = conn.conectar().prepareCall(sql);
            Rol rol = user.getRol();
            
            ps.setString(1, user.getNombres());
            ps.setString(2, user.getApellidos());
            ps.setString(3, user.getUsuario());
            ps.setString(4, user.getClave());
            ps.setString(5, user.getPregunta());
            ps.setString(6, user.getRespuesta());
            ps.setInt(7, rol.getId_rol());
            ps.setInt(8, user.getId_usuario());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            return false;
        }

    }
}
