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
import javax.servlet.http.HttpSession;
import modelo.Usuario;

public class LoginServlet extends HttpServlet {

    boolean respuesta;
    String msg;
    RequestDispatcher rd;
    Conexion conn = new Conexion();
    UsuarioDao userd = new UsuarioDao(conn);
    List<Usuario> lista;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "iniciar":
                iniciar(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
        }
    }

    protected void iniciar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        if (userd.login(usuario, clave) == null) {
            //cuando da error de contraseña
            msg = "Usuario o clave incorrecta";
            request.setAttribute("msg", msg);
            rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        } else {
            //cuando da verdadero
            HttpSession sesion = request.getSession();
            String names = userd.login(usuario, clave).getNombres();
            String surname = userd.login(usuario, clave).getApellidos();
            int rol = userd.login(usuario, clave).getRol().getId_rol();
            int id = userd.login(usuario, clave).getId_usuario();
            sesion.setAttribute("usuario", usuario);
            sesion.setAttribute("nombres", names);
            sesion.setAttribute("apellidos", surname);
            sesion.setAttribute("rol", rol);
            sesion.setAttribute("id_usuario", id);

            msg = "Bienvenido usuario: " + names;
            request.setAttribute("msg", msg);

            rd = request.getRequestDispatcher("/dashboard.jsp");
            rd.forward(request, response);
        }
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        sesion.invalidate();
        //response.sendRedirect("/login.jsp");
        rd = request.getRequestDispatcher("/index.jsp");
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
