<%-- 
    Document   : _Header
    Created on : 11-04-2021, 08:46:37 PM
    Author     : Kevins
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
    List<Menu> usuarios;
    List<Menu> roles;
    List<Menu> permisos;

    HttpSession sesion = request.getSession();
    String usuario;
   
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("http://localhost:8080/Almacenes/index.jsp");
        return;
    } else {
        usuario = sesion.getAttribute("usuario").toString();
    }
    
    almacen = menud.getMenu(Integer.parseInt(sesion.getAttribute("id_usuario").toString()), 2);
    pieza = menud.getMenu(Integer.parseInt(sesion.getAttribute("id_usuario").toString()), 3);
    tpieza = menud.getMenu(Integer.parseInt(sesion.getAttribute("id_usuario").toString()), 4);
    movi = menud.getMenu(Integer.parseInt(sesion.getAttribute("id_usuario").toString()), 5);
    usuarios = menud.getMenu(Integer.parseInt(sesion.getAttribute("id_usuario").toString()), 6); 
    roles = menud.getMenu(Integer.parseInt(sesion.getAttribute("id_usuario").toString()), 7); 
    permisos = menud.getMenu(Integer.parseInt(sesion.getAttribute("id_usuario").toString()), 8); 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Material Dash</title>
        <link rel='stylesheet' href='https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap'>
        
        <!-- plugins:css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- Layout styles -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo/style.css">
        <!-- End layout styles -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.png" />
        
        <link href="${pageContext.request.contextPath}/assets/carrusel/luxa.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/carrusel/carrusel.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <script type="text/javascript">
        history.forward();
    </script>
    <script src="assets/js/preloader.js"></script>
    <div class="body-wrapper">
        <!-- Sidernavbar partial:../../partials/_sidebar.html -->
        <aside class="mdc-drawer mdc-drawer--dismissible mdc-drawer--open">
            <div class="mdc-drawer__header">
                <a href="index.html" class="brand-logo">
                    <img src="assets/images/name.png" alt="logo">
                </a>
            </div>
            <div class="mdc-drawer__content">
                <div class="user-info">
                    <p class="name"><%=sesion.getAttribute("nombres").toString()%> <%=sesion.getAttribute("apellidos").toString()%></p>
                    <p class="email"><%=sesion.getAttribute("usuario").toString()%></p>
                </div>
                <div class="mdc-list-group">
                    <nav class="mdc-list mdc-drawer-menu">
                        
                        <div class="mdc-list-item mdc-drawer-item">
                            <a class="mdc-drawer-link" href="${pageContext.request.contextPath}/principal?action=redireccionar">
                                <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon"
                                    aria-hidden="true">home</i>
                                Dashboard
                            </a>
                        </div>
                        <% for (Menu a : pieza) {%>
                        <div class="mdc-list-item mdc-drawer-item">
                            <a class="mdc-drawer-link" href="${pageContext.request.contextPath}<%=a.getUrl()%>">
                                <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon"
                                    aria-hidden="true">track_changes</i>
                                <%=a.getNombre_modulo()%>
                            </a>
                        </div>
                        <% } %>
                        
                        <% for (Menu a : almacen) {%>
                        <div class="mdc-list-item mdc-drawer-item">
                            <a class="mdc-drawer-link" href="${pageContext.request.contextPath}<%=a.getUrl()%>">
                                <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon"
                                    aria-hidden="true">grid_on</i>
                                <%=a.getNombre_modulo()%>
                            </a>
                        </div>
                        <% } %>
                        
                        <% for (Menu a : tpieza) {%>
                        <div class="mdc-list-item mdc-drawer-item">
                            <a class="mdc-drawer-link" href="${pageContext.request.contextPath}<%=a.getUrl()%>">
                                <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon"
                                    aria-hidden="true">build</i>
                                Tipos de piezas...
                            </a>
                        </div>
                        <% } %>
                        
                        <% for (Menu a : movi) {%>
                        <div class="mdc-list-item mdc-drawer-item">
                            <a class="mdc-drawer-link" href="${pageContext.request.contextPath}<%=a.getUrl()%>">
                                <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon" aria-hidden="true">folder_special</i>
                                <%=a.getNombre_modulo()%>
                            </a>
                        </div>
                        <% } %>
                        
                        <% for (Menu a : usuarios) {%>
                        <div class="mdc-list-item mdc-drawer-item">
                            <a class="mdc-drawer-link" href="${pageContext.request.contextPath}<%=a.getUrl()%>">
                                <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon" aria-hidden="true">account_circle</i>
                                <%=a.getNombre_modulo()%>
                            </a>
                        </div>
                        <% } %>
                        
                        <% for (Menu a : roles) {%>
                        <div class="mdc-list-item mdc-drawer-item">
                            <a class="mdc-drawer-link" href="${pageContext.request.contextPath}<%=a.getUrl()%>">
                                <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon" aria-hidden="true">security</i>
                                <%=a.getNombre_modulo()%>
                            </a>
                        </div>
                        <% } %>
                        
                        <% for (Menu a : permisos) {%>
                        <div class="mdc-list-item mdc-drawer-item">
                            <a class="mdc-drawer-link" href="${pageContext.request.contextPath}<%=a.getUrl()%>">
                                <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon" aria-hidden="true">security</i>
                                <%=a.getNombre_modulo()%>
                            </a>
                        </div>
                        <% } %>
                        
                        <%-- esto esta chivo lo dejo INCIO --%>
                        <div class="mdc-list-item mdc-drawer-item">
                            <a class="mdc-expansion-panel-link" href="#" data-toggle="expansionPanel"
                                data-target="ui-sub-menu">
                                <i class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon"
                                    aria-hidden="true">dashboard</i>
                                UI Features
                                <i class="mdc-drawer-arrow material-icons">chevron_right</i>
                            </a>
                            <div class="mdc-expansion-panel" id="ui-sub-menu">
                                <nav class="mdc-list mdc-drawer-submenu">
                                    <div class="mdc-list-item mdc-drawer-item">
                                        <a class="mdc-drawer-link" href="../../pages/ui-features/buttons.html">
                                            Buttons
                                        </a>
                                    </div>
                                    <div class="mdc-list-item mdc-drawer-item">
                                        <a class="mdc-drawer-link" href="../../pages/ui-features/typography.html">
                                            Typography
                                        </a>
                                    </div>
                                </nav>
                            </div>
                        </div>
                        <%-- esto esta chivo lo dejo FINAL --%>
                    </nav>
                </div>
                <div class="profile-actions">
                    <a href="javascript:;">Configuración</a>
                    <span class="divider"></span>
                    <a href="login?action=logout">Cerrar sesión</a>
                </div>


            </div>
        </aside>
        <!-- Header nav partial -->
        <div class="main-wrapper mdc-drawer-app-content">
            <!-- partial:../../partials/_navbar.html -->
            <header class="mdc-top-app-bar">
                <div class="mdc-top-app-bar__row">
                    <div class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
                        <button
                            class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button sidebar-toggler">menu</button>
                        <span class="mdc-top-app-bar__title">Grupo 4 Programación IV!</span>
                        <div
                            class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon search-text-field d-none d-md-flex">
                            <i class="material-icons mdc-text-field__icon">search</i>
                            <input class="mdc-text-field__input" id="text-field-hero-input">
                            <div class="mdc-notched-outline">
                                <div class="mdc-notched-outline__leading"></div>
                                <div class="mdc-notched-outline__notch">
                                    <label for="text-field-hero-input" class="mdc-floating-label">Search..</label>
                                </div>
                                <div class="mdc-notched-outline__trailing"></div>
                            </div>
                        </div>
                    </div>
                    <div
                        class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end mdc-top-app-bar__section-right">
                        <!-- Dropdown -->
                        <div class="menu-button-container menu-profile d-none d-md-block">
                            <button class="mdc-button mdc-menu-button">
                                <span class="d-flex align-items-center">
                                    <span class="figure">
                                        <img src="assets/images/faces/face1.jpg" alt="user" class="user">
                                    </span>
                                    <span class="user-name"><%=sesion.getAttribute("nombres").toString()%> <%=sesion.getAttribute("apellidos").toString()%></span>
                                </span>
                            </button>
                            <div class="mdc-menu mdc-menu-surface" tabindex="-1">
                                <ul class="mdc-list" role="menu" aria-hidden="true" aria-orientation="vertical">
                                    <li class="mdc-list-item" role="menuitem">
                                        <div class="item-thumbnail item-thumbnail-icon-only">
                                            <i class="mdi mdi-account-edit-outline text-primary"></i>
                                        </div>
                                        <div
                                            class="item-content d-flex align-items-start flex-column justify-content-center">
                                            <h6 class="item-subject font-weight-normal">Editar perfil</h6>
                                        </div>
                                    </li>
                                    <li class="mdc-list-item" role="menuitem">
                                        <div class="item-thumbnail item-thumbnail-icon-only">
                                            <i class="mdi small material-icons text-primary">arrow_forward</i>
                                        </div>
                                        <div class="item-content d-flex align-items-start flex-column justify-content-center">
                                            <a href="login?action=logout">
                                                <h6 class="item-subject font-weight-normal">Cerrar sesión</h6>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Fin dropdown usuario -->
                        <div class="divider d-none d-md-block"></div>
                        <div class="menu-button-container d-none d-md-block">
                            <button class="mdc-button mdc-menu-button">
                                <i class="mdi mdi-settings"></i>
                            </button>
                            <div class="mdc-menu mdc-menu-surface" tabindex="-1">
                                <ul class="mdc-list" role="menu" aria-hidden="true" aria-orientation="vertical">
                                    <li class="mdc-list-item" role="menuitem">
                                        <div class="item-thumbnail item-thumbnail-icon-only">
                                            <i class="mdi mdi-alert-circle-outline text-primary"></i>
                                        </div>
                                        <div
                                            class="item-content d-flex align-items-start flex-column justify-content-center">
                                            <h6 class="item-subject font-weight-normal">Settings</h6>
                                        </div>
                                    </li>
                                    <li class="mdc-list-item" role="menuitem">
                                        <div class="item-thumbnail item-thumbnail-icon-only">
                                            <i class="mdi mdi-progress-download text-primary"></i>
                                        </div>
                                        <div
                                            class="item-content d-flex align-items-start flex-column justify-content-center">
                                            <h6 class="item-subject font-weight-normal">Update</h6>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <%-- 
                        <div class="menu-button-container">
                            <button class="mdc-button mdc-menu-button">
                                <i class="mdi mdi-bell"></i>
                            </button>
                            <div class="mdc-menu mdc-menu-surface" tabindex="-1">
                                <h6 class="title"> <i class="mdi mdi-bell-outline mr-2 tx-16"></i> Notifications</h6>
                                <ul class="mdc-list" role="menu" aria-hidden="true" aria-orientation="vertical">
                                    <li class="mdc-list-item" role="menuitem">
                                        <div class="item-thumbnail item-thumbnail-icon">
                                            <i class="mdi mdi-email-outline"></i>
                                        </div>
                                        <div
                                            class="item-content d-flex align-items-start flex-column justify-content-center">
                                            <h6 class="item-subject font-weight-normal">You received a new message</h6>
                                            <small class="text-muted"> 6 min ago </small>
                                        </div>
                                    </li>
                                    <li class="mdc-list-item" role="menuitem">
                                        <div class="item-thumbnail item-thumbnail-icon">
                                            <i class="mdi mdi-account-outline"></i>
                                        </div>
                                        <div
                                            class="item-content d-flex align-items-start flex-column justify-content-center">
                                            <h6 class="item-subject font-weight-normal">New user registered</h6>
                                            <small class="text-muted"> 15 min ago </small>
                                        </div>
                                    </li>
                                    <li class="mdc-list-item" role="menuitem">
                                        <div class="item-thumbnail item-thumbnail-icon">
                                            <i class="mdi mdi-alert-circle-outline"></i>
                                        </div>
                                        <div
                                            class="item-content d-flex align-items-start flex-column justify-content-center">
                                            <h6 class="item-subject font-weight-normal">System Alert</h6>
                                            <small class="text-muted"> 2 days ago </small>
                                        </div>
                                    </li>
                                    <li class="mdc-list-item" role="menuitem">
                                        <div class="item-thumbnail item-thumbnail-icon">
                                            <i class="mdi mdi-update"></i>
                                        </div>
                                        <div
                                            class="item-content d-flex align-items-start flex-column justify-content-center">
                                            <h6 class="item-subject font-weight-normal">You have a new update</h6>
                                            <small class="text-muted"> 3 days ago </small>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="menu-button-container">
                            <button class="mdc-button mdc-menu-button">
                                <i class="mdi mdi-email"></i>
                                <span class="count-indicator">
                                    <span class="count">3</span>
                                </span>
                            </button>
                            <div class="mdc-menu mdc-menu-surface" tabindex="-1">
                                <h6 class="title"><i class="mdi mdi-email-outline mr-2 tx-16"></i> Messages</h6>
                                <ul class="mdc-list" role="menu" aria-hidden="true" aria-orientation="vertical">
                                    <li class="mdc-list-item" role="menuitem">
                                        <div class="item-thumbnail">
                                            <img src="assets/images/faces/face4.jpg" alt="user">
                                        </div>
                                        <div
                                            class="item-content d-flex align-items-start flex-column justify-content-center">
                                            <h6 class="item-subject font-weight-normal">Mark send you a message</h6>
                                            <small class="text-muted"> 1 Minutes ago </small>
                                        </div>
                                    </li>
                                    <li class="mdc-list-item" role="menuitem">
                                        <div class="item-thumbnail">
                                            <img src="assets/images/faces/face2.jpg" alt="user">
                                        </div>
                                        <div
                                            class="item-content d-flex align-items-start flex-column justify-content-center">
                                            <h6 class="item-subject font-weight-normal">Cregh send you a message</h6>
                                            <small class="text-muted"> 15 Minutes ago </small>
                                        </div>
                                    </li>
                                    <li class="mdc-list-item" role="menuitem">
                                        <div class="item-thumbnail">
                                            <img src="assets/images/faces/face3.jpg" alt="user">
                                        </div>
                                        <div
                                            class="item-content d-flex align-items-start flex-column justify-content-center">
                                            <h6 class="item-subject font-weight-normal">Profile picture updated</h6>
                                            <small class="text-muted"> 18 Minutes ago </small>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="menu-button-container d-none d-md-block">
                            <button class="mdc-button mdc-menu-button">
                                <i class="mdi mdi-arrow-down-bold-box"></i>
                            </button>
                            <div class="mdc-menu mdc-menu-surface" tabindex="-1">
                                <ul class="mdc-list" role="menu" aria-hidden="true" aria-orientation="vertical">
                                    <li class="mdc-list-item" role="menuitem">
                                        <div class="item-thumbnail item-thumbnail-icon-only">
                                            <i class="mdi mdi-lock-outline text-primary"></i>
                                        </div>
                                        <div
                                            class="item-content d-flex align-items-start flex-column justify-content-center">
                                            <h6 class="item-subject font-weight-normal">Lock screen</h6>
                                        </div>
                                    </li>
                                    <li class="mdc-list-item" role="menuitem">
                                        <div class="item-thumbnail item-thumbnail-icon-only">
                                            <i class="mdi mdi-logout-variant text-primary"></i>
                                        </div>
                                        <div
                                            class="item-content d-flex align-items-start flex-column justify-content-center">
                                            <h6 class="item-subject font-weight-normal">Logout</h6>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        --%>
                    </div>
                </div>
            </header>
            <!-- partial -->
            <div class="page-wrapper mdc-toolbar-fixed-adjust">
    </body>
</html>
