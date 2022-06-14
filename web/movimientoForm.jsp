<%-- 
    Document   : movimientoForm
    Created on : 10-21-2021, 10:28:38 PM
    Author     : tatiana
--%>
<%@page import="dao.AlmacenDao"%>
<%@page import="modelo.Almacen"%>
<%@page import="modelo.Pieza"%>
<%@page import="dao.PiezaDao"%>
<%
    PiezaDao piezadao = new PiezaDao(new Conexion());
    List<Pieza> piezas = piezadao.selectAll();

    AlmacenDao almacendao = new AlmacenDao(new Conexion());
    List<Almacen> almacenes = almacendao.getAllAlmacen();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo movimiento</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>
        <main class="content-wrapper">
            <form action="movimiento?action=insertar" method="POST">
                <div class="mdc-layout-grid">
                    <div class="mdc-layout-grid__inner">
                        <div class="mdc-layout-grid__cell--span-12">
                            <div class="mdc-card">
                                <div class="card">
                                    <h6 class="card-title">Registro de Movimientos</h6>
                                    <div class="template-demo">
                                        <div class="mdc-layout-grid__inner">

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">

                                                <div class="mdc-text-field mdc-text-field--outlined">
                                                    <select name="id_pieza" class="mdc-text-field__input">
                                                        <option>Seleccionar</option>
                                                        <% for (Pieza p : piezas) {%>
                                                        <option value="<%=p.getId_pieza()%>"><%=p.getTipo_pieza()%> <%=p.getDescripcion()%></option>
                                                        <% }%>
                                                    </select>
                                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                        <div class="mdc-notched-outline__leading"></div>
                                                        <div class="mdc-notched-outline__notch" style="">
                                                            <label class="mdc-floating-label">PIEZA</label>
                                                        </div>
                                                        <div class="mdc-notched-outline__trailing"></div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">

                                                <div class="mdc-text-field mdc-text-field--outlined">
                                                    <select name="id_almacen" class="mdc-text-field__input">
                                                        <option>Seleccionar</option>
                                                        <% for (Almacen a : almacenes) {%>
                                                        <option value="<%=a.getId_almacen()%>"><%=a.getNum_almacen()%>, <%=a.getDescripcion()%> <%=a.getDireccion()%></option>
                                                        <% }%>
                                                    </select>
                                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                        <div class="mdc-notched-outline__leading"></div>
                                                        <div class="mdc-notched-outline__notch" style="">
                                                            <label class="mdc-floating-label">ALMACEN</label>
                                                        </div>
                                                        <div class="mdc-notched-outline__trailing"></div>
                                                    </div>
                                                </div>

                                            </div>

                                            <input class="mdc-text-field__input" id="user" type="hidden" name="user" value="<%=sesion.getAttribute("id_usuario").toString()%>">
                                            

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-3-desktop">
                                                <button type="submit" class="mdc-button mdc-button--outlined outlined-button--secondary mdc-ripple-upgraded">Enviar</button>
                                                <a class="mdc-button mdc-button--outlined outlined-button--primary mdc-ripple-upgraded" href="movimiento?action=view">
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
