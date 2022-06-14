<%-- 
    Document   : header
    Created on : 10-19-2021, 09:03:53 PM
    Author     : tatiana
--%>

<%@page import="modelo.Menu"%>
<%@page import="java.util.List"%>
<%@page import="conexion.Conexion"%>
<%@page import="dao.MenuDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conexion conn = new Conexion();
    MenuDao menud = new MenuDao(conn);
    RequestDispatcher rd;
    List<Menu> almacen;
    List<Menu> pieza;
    List<Menu> tpieza;
    List<Menu> movi;

    HttpSession sesion = request.getSession();
    String usuario;
    if (session.getAttribute("usuario") != null) {
        usuario = sesion.getAttribute("usuario").toString();
    } else {

        request.getRequestDispatcher("/login.jsp");
        //response.sendRedirect("login.jsp");
    }
    almacen = menud.getMenu(Integer.parseInt(sesion.getAttribute("rol").toString()), 2);
    pieza = menud.getMenu(Integer.parseInt(sesion.getAttribute("rol").toString()), 3);
    tpieza = menud.getMenu(Integer.parseInt(sesion.getAttribute("rol").toString()), 4);
    movi = menud.getMenu(Integer.parseInt(sesion.getAttribute("rol").toString()), 5);
%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/materialize.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/js/materialize.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="pink">
            <div class="nav-wrapper pink " >
                <a href="#!" class="brand-logo">Logo</a>
                <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                <ul class="right hide-on-med-and-down">
                    <%-- ${pageContext.request.contextPath} es similar que el base:url() de CI --%>
                    <%-- <li><a href="${pageContext.request.contextPath}/pieza?action=view">Piezas</a></li> --%>
                    <%-- lo anterior quiere decir: http://localhost:808/Almacenes/pieza?action=view --%>
                    <li><a href="${pageContext.request.contextPath}/principal?action=redireccionar">Inicio</a></li>


                    <% for (Menu a : almacen) {%>
                    <li><a href="${pageContext.request.contextPath}<%=a.getUrl()%>"><%=a.getNombre_modulo()%></a></li>
                    <%  }%>
                    <% for (Menu a : pieza) {%>
                    <li><a href="${pageContext.request.contextPath}<%=a.getUrl()%>"><%=a.getNombre_modulo()%></a></li>
                    <%  }%>
                    
                    <% for (Menu a : tpieza) {%>
                    <li><a href="${pageContext.request.contextPath}<%=a.getUrl()%>"><%=a.getNombre_modulo()%></a></li>
                    <%  }%>
                    
                    <% for (Menu a : movi) {%>
                    <li><a href="${pageContext.request.contextPath}<%=a.getUrl()%>"><%=a.getNombre_modulo()%></a></li>
                    <%  }%>
                    
                        <%--<li><a href="${pageContext.request.contextPath}/almacen?action=getAllAlmacen">Almacen</a></li>
                    <li><a href="${pageContext.request.contextPath}/pieza?action=seleccionar">Piezas</a></li>
                    <li><a href="${pageContext.request.contextPath}/tipo?action=seleccionar">Tipos de piezas disponibles</a></li>
                    <li><a href="${pageContext.request.contextPath}/movimiento?action=view">Movimientos</a></li>--%>
                    <li><a href="login?action=logout">Cerrar sesión</a></li>
                </ul>
            </div>
        </nav>

        <ul class="sidenav" id="mobile-demo">
            <li><a href="${pageContext.request.contextPath}/principal?action=redireccionar">Inicio</a></li>
            <li><a href="${pageContext.request.contextPath}/almacen?action=getAllAlmacen">Almacen</a></li>
            <li><a href="${pageContext.request.contextPath}/pieza?action=seleccionar">Piezas</a></li>
            <li><a href="${pageContext.request.contextPath}/tipo?action=seleccionar">Tipos de piezas disponibles</a></li>
            <li><a href="${pageContext.request.contextPath}/movimiento?action=view">Movimientos</a></li>
        </ul>
    </body>
</html>
