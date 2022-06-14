package controlador;

import conexion.Conexion;
import dao.RolDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Rol;

public class RolesServlet extends HttpServlet {

    boolean respuesta;
    String msg;
    RequestDispatcher rd;
    Conexion conn = new Conexion();
    RolDao rold = new RolDao(conn);
    List<Rol> lista;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        switch (action) {
            case "view":
                selectAll(request, response);
                break;
            case "insertarRoles":
                insertarRol(request, response);
                break;
            case "seleccionarById":
                selectAllById(request, response);
                break;
            case "actualizar":
                update(request, response);
                break;
            case "eliminar":
                eliminarRol(request, response);
                break;
        }

    }

    protected void selectAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        lista = rold.getAllRoles();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/mostrarRoles.jsp");
        rd.forward(request, response);

    }

    protected void insertarRol(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombreRol = request.getParameter("nombreRol");
        String crear = request.getParameter("crear");
        String actualizar = request.getParameter("actualizar");
        String eliminar = request.getParameter("eliminar");

        Rol r = new Rol(0);
        r.setNombre_rol(nombreRol);
        r.setCrear(crear);
        r.setActualizar(actualizar);
        r.setEliminar(eliminar);

        respuesta = rold.insert(r);
        if (respuesta) {
            msg = "Registro guardado";
        } else {
            msg = "No guardado";
        }

        request.setAttribute("msg", msg);
        rd = request.getRequestDispatcher("/insertRoles.jsp");
        rd.forward(request, response);

    }

    protected void eliminarRol(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        respuesta = rold.delete(id);
        if (respuesta) {
            msg = "Registro eliminado";
        } else {
            msg = "No eliminado";
        }
            
        request.setAttribute("msg", msg);
        lista = rold.getAllRoles();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/mostrarRoles.jsp");
        rd.forward(request, response);

    }

    protected void selectAllById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        lista = rold.selectById(id);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/actualizarRoles.jsp");
        rd.forward(request, response);

    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id_rol"));
        String nombreRol = request.getParameter("nombre_rol");
        String crear = request.getParameter("crear");
        String actualizar = request.getParameter("actualizar");
        String eliminar = request.getParameter("eliminar");

        Rol r = new Rol(id);
        r.setNombre_rol(nombreRol);
        r.setCrear(crear);
        r.setActualizar(actualizar);
        r.setEliminar(eliminar);

        respuesta = rold.update(r);
        if (respuesta) {
            msg = "Registro actualizado";
        } else {
            msg = "No actualizado";
        }
        
        
        lista = rold.getAllRoles();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/mostrarRoles.jsp");
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
