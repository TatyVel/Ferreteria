package controlador;

import conexion.Conexion;
import dao.TipoPiezaDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.TipoPieza;

public class TipoPiezaServlet extends HttpServlet {
    
    String msg;
    boolean respuesta;
    Conexion conn = new Conexion();
    TipoPiezaDao tpD = new TipoPiezaDao(conn);
    List<TipoPieza> lista;
    RequestDispatcher rd;
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        switch(action){
            case "insertar":
                insert(request, response);
                break;
            case "seleccionar":
                selectAll(request, response);
                break;
            case "eliminar":
                delete(request, response);
                break;
            case "actualizar":
                update(request, response);
                break;
            case "seleccionarById":
                selectById(request, response);
                break;
        
        }

    }

    protected void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String tipo_pieza = request.getParameter("tipo");
        String descripcion = request.getParameter("descripcion");
        
        TipoPieza tp = new TipoPieza(0);
        tp.setTipo_pieza(tipo_pieza);
        tp.setDescripcion(descripcion);
        
        respuesta = tpD.insert(tp);
        if(respuesta){
            msg = "Registro guardado";
        }else{
            msg="No se guardo";
        }
        
        request.setAttribute("msg", msg);
        rd = request.getRequestDispatcher("/formTipo.jsp");
        rd.forward(request, response);
        
    }

    protected void selectAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        lista = tpD.selectAll();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/mostrarTipo.jsp");
        rd.forward(request, response);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        respuesta = tpD.Eliminar(id);
        if (respuesta) {
            msg = "Registro eliminado";
        } else {
            msg = "No eliminado";
        }
            
        request.setAttribute("msg", msg);
        lista = tpD.selectById(id);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/formTipo.jsp");
        rd.forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id_tipo"));
        String tipo_pieza = request.getParameter("tipo");
        String descripcion = request.getParameter("descripcion");
        
        TipoPieza tp = new TipoPieza(id);
        tp.setTipo_pieza(tipo_pieza);
        tp.setDescripcion(descripcion);
        
        respuesta = tpD.actualizar(tp);
        if (respuesta) {
            msg = "Registro actualizado";
        } else {
            msg = "No actualizado";
        }
        
        lista = tpD.selectAll();
        request.setAttribute("msg", msg);
        lista = tpD.selectById(id);
        request.setAttribute("lista", lista);
        request.setAttribute("lista",lista);
        rd = request.getRequestDispatcher("/formTipo.jsp");
        rd.forward(request, response);
        
    }

    protected void selectById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        lista = tpD.selectById(id);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/actualizarTipo.jsp");
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
