package controlador;

import conexion.Conexion;
import dao.UsuarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Rol;
import modelo.Usuario;

public class UsuariosServlet extends HttpServlet {

    boolean respuesta;
    String msgI, msgD, msgU;
    RequestDispatcher rd;
    Conexion conn = new Conexion();
    UsuarioDao userd = new UsuarioDao(conn);
    List<Usuario> lista;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view":
                selectAll(request, response);
                break;
            case "insertarUsuario":
                insertUsuario(request, response);
                break;
            case "eliminar":
                deleteUsuario(request, response);
                break;
            case "seleccionarById":
                selectById(request, response);
                break;
            case "actualizar":
                updateUsuario(request, response);
                break;
        }
    }

    protected void selectAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        lista = userd.getAllUsuarios();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/mostrarUsuarios.jsp");
        rd.forward(request, response);
    }

    protected void insertUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //llenar objeto
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        String preguntaR = request.getParameter("pregunta");
        String respuestaR = request.getParameter("respuesta");
        int id_rol = Integer.parseInt(request.getParameter("id_rol"));

        Rol rol = new Rol(id_rol);
        Usuario user = new Usuario(0);
        user.setNombres(nombres);
        user.setApellidos(apellidos);
        user.setUsuario(usuario);
        user.setPregunta(preguntaR);
        user.setRespuesta(respuestaR);
        user.setClave(clave);
        user.setRol(rol);

        respuesta = userd.insertUser(user);

        if (respuesta) {
            msgI = "registro insertado";
        } else {
            msgI = "el registro no se inserto";
        }

        request.setAttribute("msgI", msgI);

        lista = userd.getAllUsuarios();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/mostrarUsuarios.jsp");
        rd.forward(request, response);
    }

    protected void deleteUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        respuesta = userd.delete(id);
        if (respuesta) {
            msgD = "Borro el registro";
        } else {
            msgD = "No se Borro el registro";
        }

        lista = userd.getAllUsuarios();
        request.setAttribute("lista", lista);
        request.setAttribute("msgD", msgD);

        rd = request.getRequestDispatcher("/mostrarUsuarios.jsp");
        rd.forward(request, response);
    }

    protected void selectById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        lista = userd.getUsuario(id);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/actualizarUsuario.jsp");
        rd.forward(request, response);
    }

    protected void updateUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //llenar objeto
        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        String preguntaR = request.getParameter("pregunta");
        String respuestaR = request.getParameter("respuesta");
        int id_rol = Integer.parseInt(request.getParameter("id_rol"));

        Rol rol = new Rol(id_rol);
        Usuario user = new Usuario(id_usuario);
        user.setNombres(nombres);
        user.setApellidos(apellidos);
        user.setUsuario(usuario);
        user.setPregunta(preguntaR);
        user.setRespuesta(respuestaR);
        user.setClave(clave);
        user.setRol(rol);

        respuesta = userd.update(user);

        if (respuesta) {
            msgU = "registro modificado";
        } else {
            msgU = "el registro no se modifico";
        }

        request.setAttribute("msgU", msgU);

        lista = userd.getAllUsuarios();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/mostrarUsuarios.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
