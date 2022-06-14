<%-- 
    Document   : movimientoForm
    Created on : 10-21-2021, 10:28:38 PM
    Author     : tatiana
--%>
<%@page import="dao.RolDao"%>
<%@page import="modelo.Rol"%>
<%@page import="modelo.Menu"%>
<%@page import="dao.MenuDao"%>
<%
    RolDao r = new RolDao(new Conexion());
    List<Rol> rol = r.getAllRoles();

    MenuDao m = new MenuDao(new Conexion());
    List<Menu> menu = m.selecTodo();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Permiso</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>
        <main class="content-wrapper">
            <form action="permiso?action=insertar" method="POST">
                <div class="mdc-layout-grid">
                    <div class="mdc-layout-grid__inner">
                        <div class="mdc-layout-grid__cell--span-12">
                            <div class="mdc-card">
                                <div class="card">
                                    <h6 class="card-title">Registro de Permiso</h6>
                                    <div class="template-demo">
                                        <div class="mdc-layout-grid__inner">

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">

                                                <div class="mdc-text-field mdc-text-field--outlined">
                                                    <select name="id_rol" class="mdc-text-field__input">
                                                        <option>Seleccionar</option>
                                                        <% for (Rol ro : rol) {%>
                                                        <option value="<%=ro.getId_rol()%>"><%=ro.getNombre_rol()%></option>
                                                        <% }%>
                                                    </select>
                                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                        <div class="mdc-notched-outline__leading"></div>
                                                        <div class="mdc-notched-outline__notch" style="">
                                                            <label class="mdc-floating-label">Rol</label>
                                                        </div>
                                                        <div class="mdc-notched-outline__trailing"></div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">

                                                <div class="mdc-text-field mdc-text-field--outlined">
                                                    <select name="id_menu" class="mdc-text-field__input">
                                                        <option>Seleccionar</option>
                                                        <% for (Menu me : menu) {%>
                                                        <option value="<%=me.getId_menu()%>"><%=me.getNombre_modulo()%></option>
                                                        <% }%>
                                                    </select>
                                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                        <div class="mdc-notched-outline__leading"></div>
                                                        <div class="mdc-notched-outline__notch" style="">
                                                            <label class="mdc-floating-label">Modulo</label>
                                                        </div>
                                                        <div class="mdc-notched-outline__trailing"></div>
                                                    </div>
                                                </div>

                                            </div>                                            

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-3-desktop">
                                                <button type="submit" class="mdc-button mdc-button--outlined outlined-button--secondary mdc-ripple-upgraded">Enviar</button>
                                                <a class="mdc-button mdc-button--outlined outlined-button--primary mdc-ripple-upgraded" href="permiso?action=view">
                                                    <i class="material-icons left">assignment</i>
                                                    Ver registros
                                                </a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </main>
        ${msg}

        <%@include file="Template/_Footer.jsp" %>
    </body>
</html>
