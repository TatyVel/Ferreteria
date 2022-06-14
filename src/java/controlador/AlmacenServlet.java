
package controlador;

import conexion.Conexion;
import dao.AlmacenDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Almacen;

public class AlmacenServlet extends HttpServlet {
    
String msg;
boolean respuesta;
Conexion conn = new Conexion();
AlmacenDao ald = new AlmacenDao(conn);
RequestDispatcher rd;
List<Almacen> listAlmacen;

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        switch(action){
            case "InsertAlmacen":  InsertAlmacen(request, response);
            break;
            
            case "getAllAlmacen": getAllAlmacen(request, response);
            break;
            
            case "DeleteAlmacen": DeleteAlmacen(request, response);
            break;
            
            case "UpdateAlmacen": UpdateAlmacen(request, response);
            break;
            
            case "getByIdAlmacen": getByIdAlmacen(request, response);
            break;
            
            
        
        }
    }
    
    protected void InsertAlmacen(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //llenar objeto
        int num_almacen = Integer.parseInt(request.getParameter("num_almacen"));
        String descripcion = request.getParameter("descripcion");
        String direccion = request.getParameter("direccion");
        String nombre_estanteria = request.getParameter("nombre_estanteria");
        
        Almacen al = new Almacen(0);
        al.setNum_almacen(num_almacen);
        al.setDescripcion(descripcion);
        al.setDireccion(direccion);
        al.setNombre_estanteria(nombre_estanteria);
        
        respuesta = ald.InsertAlmacen(al);
        
        if (respuesta) {
            msg = "registro insertado";
        }else{
        msg = "el registro no se inserto";
        }
        
        request.setAttribute("msg", msg);
        rd = request.getRequestDispatcher("/InsertAlmacen.jsp");
        rd.forward(request, response);
        
    }
    
    protected void getAllAlmacen(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        listAlmacen = ald.getAllAlmacen();
        request.setAttribute("listAlmacen", listAlmacen);
        rd = request.getRequestDispatcher("/Almacen.jsp");
        rd.forward(request, response);
        
    }
    
    protected void DeleteAlmacen(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id_almacen = Integer.parseInt(request.getParameter("id_almacen"));
        
        respuesta= ald.DeleteAlmacen(id_almacen);
        if (respuesta) {
            msg = "Borro el registro"; 
        }else{
         msg = "No se Borro el registro";
        }
        
        listAlmacen = ald.getAllAlmacen();
        request.setAttribute("listAlmacen", listAlmacen);
        rd = request.getRequestDispatcher("/Almacen.jsp");
        rd.forward(request, response);
        
    }
    
     protected void getByIdAlmacen(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_almacen = Integer.parseInt(request.getParameter("id_almacen"));
        listAlmacen = ald.getByIdAlmacen(id_almacen);
        request.setAttribute("listAlmacen", listAlmacen);
        rd = request.getRequestDispatcher("/UpdateAlmacen.jsp");
        rd.forward(request, response);
    }
    
    protected void UpdateAlmacen(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_almacen = Integer.parseInt(request.getParameter("id_almacen"));
        int num_almacen = Integer.parseInt(request.getParameter("num_almacen"));
        String descripcion = request.getParameter("descripcion");
        String direccion = request.getParameter("direccion");
        String nombre_estanteria = request.getParameter("nombre_estanteria");
        
        Almacen alm = new Almacen(id_almacen); 
        alm.setNum_almacen(num_almacen);
        alm.setDescripcion(descripcion);
        alm.setDireccion(direccion);
        alm.setNombre_estanteria(nombre_estanteria);
        
        respuesta = ald.UpdateAlmacen(alm);
        if (respuesta) {
            msg = "Actualizo el registro"; 
        }else{
         msg = "No se Actualizo el registro";
        }
        
        listAlmacen = ald.getAllAlmacen();
        request.setAttribute("msg", msg);
        request.setAttribute("listAlmacen", listAlmacen);
        rd = request.getRequestDispatcher("/Almacen.jsp");
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

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
