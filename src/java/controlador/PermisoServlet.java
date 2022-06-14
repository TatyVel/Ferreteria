package controlador;

import conexion.Conexion;
import dao.PermisoDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Menu;
import modelo.Permiso;
import modelo.Rol;

public class PermisoServlet extends HttpServlet {
    
    String msg;
    boolean respuesta;
    Conexion conn = new Conexion();
    PermisoDao per = new PermisoDao(conn);
    RequestDispatcher rd;
    List<Permiso> lista;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view":
                permisoView(request, response);
                break;
            case "insertar":
                insert(request, response);
                break;
            case "seleccionarById":
                SelectAllById(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "eliminar":
                delete(request, response);
                break;
            
        }
    }
    
    protected void permisoView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        lista = per.selectAll();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/permisoMostrar.jsp");
        rd.forward(request, response);
    }
    
    protected void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       int id_rol = Integer.parseInt(request.getParameter("id_rol"));
       int id_menu = Integer.parseInt(request.getParameter("id_menu"));
       
       Rol r = new Rol(id_rol);
       Menu m = new Menu(id_menu);
       Permiso p = new Permiso(0);
       p.setId_rol(r);
       p.setId_menu(m);
       
       respuesta = per.insertPermiso(p);
       
        if (respuesta) {
            msg = "Registro guardado";
        } else {
            msg = "No guardado";
        }
       request.setAttribute("msg", msg);
        rd = request.getRequestDispatcher("/permisoInsertar.jsp");
        rd.forward(request, response);
        
        
    }
    
    protected void SelectAllById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_rol_menu = Integer.parseInt(request.getParameter("id_rol_menu"));
        lista = per.selectAllById(id_rol_menu);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/permisoActualizar.jsp");
        rd.forward(request, response);
        
    }
    
    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       int id_rol_menu = Integer.parseInt(request.getParameter("id_rol_menu"));
       int id_rol = Integer.parseInt(request.getParameter("id_rol"));
       int id_menu = Integer.parseInt(request.getParameter("id_menu"));
       
       Rol r = new Rol(id_rol);
       Menu m = new Menu(id_menu);
       Permiso p = new Permiso(id_rol_menu);
       p.setId_rol(r);
       p.setId_menu(m);
       
       respuesta = per.update(p);
       
        if (respuesta) {
            msg = "Registro guardado";
        } else {
            msg = "No guardado";
        }
        request.setAttribute("msg", msg);
        lista = per.selectAll();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/permisoMostrar.jsp");
        rd.forward(request, response);
        
    }
    
    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_rol_menu= Integer.parseInt(request.getParameter("id_rol_menu"));
        
        respuesta = per.delete(id_rol_menu);
        if (respuesta) {
            msg = "Registro eliminado";
        } else {
            msg = "No eliminado";
        }
        request.setAttribute("msg", msg);
         lista = per.selectAll();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/permisoMostrar.jsp");
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
