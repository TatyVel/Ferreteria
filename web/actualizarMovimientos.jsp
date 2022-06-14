<%-- 
    Document   : actualizarMovimientos
    Created on : 10-21-2021, 11:10:07 PM
    Author     : tatiana
--%>
<%@page import="dao.PiezaDao"%>
<%@page import="modelo.Almacen"%>
<%@page import="dao.AlmacenDao"%>
<%@page import="modelo.Pieza"%>
<%
    PiezaDao piezadao = new PiezaDao(new Conexion());
    List<Pieza> piezas = piezadao.selectAll();

    AlmacenDao almacendao = new AlmacenDao(new Conexion());
    List<Almacen> almacenes = almacendao.getAllAlmacen();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="m" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movimientos</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>
        <main class="content-wrapper">
            <form action="movimiento?action=update" method="POST">
                <div class="mdc-layout-grid">
                    <div class="mdc-layout-grid__inner">
                        <div class="mdc-layout-grid__cell--span-12">
                            <div class="mdc-card">
                                <h6 class="card-title">Actualizar Movimientos</h6>
                                <div class="template-demo">
                                    <div class="mdc-layout-grid__inner">
                                        <m:forEach items="${lista}" var="mo">

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                                <div class="mdc-text-field mdc-text-field--outlined">
                                                    <input class="mdc-text-field__input" id="id_movimientos" type="number" name="id_movimientos" value="${mo.id_movimientos}">

                                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                        <div class="mdc-notched-outline__leading"></div>
                                                        <div class="mdc-notched-outline__notch" style="">
                                                            <label for="tipo" class="mdc-floating-label" style="">ID</label>
                                                        </div>
                                                        <div class="mdc-notched-outline__trailing"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">

                                                <div class="mdc-text-field mdc-text-field--outlined">
                                                    <select name="id_pieza" class="mdc-text-field__input">
                                                        <%-- convierte de JSTL a scriptlet //para poder hacer la conparación --%>
                                                        <m:set var="idpieza" value="${mo.id_pieza.id_pieza}"/>
                                                        <option>Seleccionar</option>
                                                        <% for (Pieza p : piezas) {
                                                                if (p.getId_pieza() == Integer.parseInt(pageContext.getAttribute("idpieza").toString())) {%>
                                                        <option value="<%=p.getId_pieza()%>" selected><%=p.getTipo_pieza()%> <%=p.getDescripcion()%></option>
                                                        <% } else {%>
                                                        <option value="<%=p.getId_pieza()%>"><%=p.getTipo_pieza()%> <%=p.getDescripcion()%></option>
                                                        <% }
                                                            } %>
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
                                                        <%-- convierte de JSTL a scriptlet //para poder hacer la conparación --%>
                                                        <m:set var="idalmacen" value="${mo.id_almacen.id_almacen}"/>
                                                        <option>Seleccionar</option>
                                                        <% for (Almacen a : almacenes) {
                                                                if (a.getId_almacen() == Integer.parseInt(pageContext.getAttribute("idalmacen").toString())) {%>
                                                        <option value="<%=a.getId_almacen()%>" selected><%=a.getNum_almacen()%> <%=a.getDescripcion()%> <%=a.getDireccion()%></option>
                                                        <% } else {%>
                                                        <option value="<%=a.getId_almacen()%>"><%=a.getNum_almacen()%> <%=a.getDescripcion()%> <%=a.getDireccion()%></option>
                                                        <% }
                                                            }%>
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



                                        </m:forEach>


                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12-desktop">
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
            </form>
        </main>
        ${msg}
        <%@include file="Template/_Footer.jsp" %>
    </body>
</html>
