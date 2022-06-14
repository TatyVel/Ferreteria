package controlador;

import conexion.Conexion;
import dao.PiezaDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Pieza;
import modelo.TipoPieza;

public class PiezaServlet extends HttpServlet {

    String msg;
    boolean respuesta;
    List<Pieza> lista;

    Conexion cone = new Conexion();
    PiezaDao piezaD = new PiezaDao(cone);

    RequestDispatcher rd;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action) {
            case "insertar":
                insert(request, response);
                break;
            case "seleccionar":
                selectAll(request, response);
                break;
            case "seleccionarById":
                selectById(request, response);
                break;
            case "actualizar":
                update(request, response);
                break;
            case "eliminar":
                delete(request, response);
                break;
            case "inicio":
                inicio(request, response);
                break;
        }

    }

    protected void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         String tipoPieza = (request.getParameter("tipo_pieza"));
        int modelo = Integer.parseInt(request.getParameter("modelo"));
        double precio = Double.parseDouble(request.getParameter("precio"));
        String descripcion = (request.getParameter("descripcion"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        int id_tipo = Integer.parseInt(request.getParameter("id_tipo"));

        TipoPieza tp = new TipoPieza(id_tipo);

        Pieza p = new Pieza(0);
        p.setTipo_pieza(tipoPieza);
        p.setModelo(modelo);
        p.setPrecio(precio);
        p.setDescripcion(descripcion);
        p.setCantidad(cantidad);
        p.setId_tipo(tp);

        respuesta = piezaD.insert(p);
        if (respuesta) {
            msg = "Registro guardado";
        } else {
            msg = "No guardado";
        }

        request.setAttribute("msg", msg);
        rd = request.getRequestDispatcher("/PiezaForm.jsp");
        rd.forward(request, response);

    }

    protected void selectAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        lista = piezaD.selectAll();

        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/PiezaMostrar.jsp");
        rd.forward(request, response);
    }

    protected void selectById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        lista = piezaD.selectById(id);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/PiezaActualizar.jsp");
        rd.forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int IdPieza = Integer.parseInt(request.getParameter("id_pieza"));
        String tipoPieza = (request.getParameter("tipo_pieza"));
        int modelo = Integer.parseInt(request.getParameter("modelo"));
        double precio = Double.parseDouble(request.getParameter("precio"));
        String descripcion = (request.getParameter("descripcion"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        int id_tipo = Integer.parseInt(request.getParameter("id_tipo"));

        TipoPieza tp = new TipoPieza(id_tipo);

        Pieza p = new Pieza(IdPieza);
        
        p.setTipo_pieza(tipoPieza);
        
        p.setModelo(modelo);
        p.setPrecio(precio);
        p.setDescripcion(descripcion);
        p.setCantidad(cantidad);
        p.setId_tipo(tp);

        respuesta = piezaD.update(p);
        if (respuesta) {
            msg = "Registro actualizado";
        } else {
            msg = "No actualizado";
        }

        request.setAttribute("msg", msg);
        lista = piezaD.selectAll();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/PiezaMostrar.jsp");
        rd.forward(request, response);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        respuesta = piezaD.delete(id);
        if (respuesta) {
            msg = "Registro eliminado";
        } else {
            msg = "No eliminado";
        }

        request.setAttribute("msg", msg);
        lista = piezaD.selectAll();
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/PiezaMostrar.jsp");
        rd.forward(request, response);
    }

    protected void inicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        rd = request.getRequestDispatcher("/PiezaForm.jsp");
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
