package controlador;

import conexion.Conexion;
import dao.MovimientoDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Almacen;
import modelo.Movimiento;
import modelo.Pieza;
import modelo.Usuario;

public class MovimientoServlet extends HttpServlet {

    String msg;
    boolean respuesta;
    Conexion conn = new Conexion();
    MovimientoDao md = new MovimientoDao(conn);
    RequestDispatcher rd;
    List<Movimiento> lista;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        switch (action) {
            case "view":
                movimientoView(request, response);
                break;

            case "insertar":
                insertMovimiento(request, response);
                break;

            case "seleccionarById":
                selectAllById(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "eliminar":
                delete(request, response);
                break;
            
        }
    }

    protected void movimientoView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        lista = md.selectAll();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/mostrarMovimientos.jsp");
        rd.forward(request, response);
    }

    protected void insertMovimiento(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       int id_pieza = Integer.parseInt(request.getParameter("id_pieza"));
       int id_almacen = Integer.parseInt(request.getParameter("id_almacen"));
       int id_usuario = Integer.parseInt(request.getParameter("user"));
       
       Pieza p = new Pieza(id_pieza);
       Almacen al = new Almacen(id_almacen);
       Usuario u = new Usuario(id_usuario);
       Movimiento m = new Movimiento(0);
       m.setId_pieza(p);
       m.setId_almacen(al);
       m.setId_usuario(u);
       
       respuesta = md.insertMovimiento(m);
       
        if (respuesta) {
            msg = "Registro guardado";
        } else {
            msg = "No guardado";
        }
       request.setAttribute("msg", msg);
        rd = request.getRequestDispatcher("/movimientoForm.jsp");
        rd.forward(request, response);
        
       

    }

    protected void selectAllMovimineto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    
    protected void selectAllById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_movimientos = Integer.parseInt(request.getParameter("id_movimientos"));
        lista = md.selectAllById(id_movimientos);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/actualizarMovimientos.jsp");
        rd.forward(request, response);

    }
    
    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       int id_movimientos = Integer.parseInt(request.getParameter("id_movimientos"));
       int id_pieza = Integer.parseInt(request.getParameter("id_pieza"));
       int id_almacen = Integer.parseInt(request.getParameter("id_almacen"));
       int id_usuario = Integer.parseInt(request.getParameter("user"));
       
       Pieza p = new Pieza(id_pieza);
       Almacen al = new Almacen(id_almacen);
       Usuario u = new Usuario(id_usuario);
       Movimiento m = new Movimiento(id_movimientos);
       m.setId_pieza(p);
       m.setId_almacen(al);
       m.setId_usuario(u);
       
       respuesta = md.update(m);
       
        if (respuesta) {
            msg = "Registro guardado";
        } else {
            msg = "No guardado";
        }
        request.setAttribute("msg", msg);
        lista = md.selectAll();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/mostrarMovimientos.jsp");
        rd.forward(request, response);
    }
    
    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_movimientos= Integer.parseInt(request.getParameter("id_movimientos"));
        
        respuesta = md.delete(id_movimientos);
        if (respuesta) {
            msg = "Registro eliminado";
        } else {
            msg = "No eliminado";
        }
        request.setAttribute("msg", msg);
         lista = md.selectAll();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/mostrarMovimientos.jsp");
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
