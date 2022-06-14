<%-- 
    Document   : PiezaActualizar
    Created on : 21-oct-2021, 0:33:33
    Author     : Chiquillo
--%>

<%@page import="modelo.TipoPieza"%>
<%@page import="dao.TipoPiezaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    TipoPiezaDao tpiezad = new TipoPiezaDao(new Conexion());
    List<TipoPieza> tipopieza = tpiezad.selectAll();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar pieza</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>
        <main class="content-wrapper">
            <form action="pieza?action=actualizar" method="POST" autocomplete="off">
                <div class="mdc-layout-grid">
                    <div class="mdc-layout-grid__inner">
                        <div class="mdc-layout-grid__cell--span-12">
                            <div class="mdc-card">
                                <h6 class="card-title">Modificar registro de pieza</h6>
                                <div class="template-demo">
                                    <div class="mdc-layout-grid__inner">

                                        <c:forEach items="${lista}" var="ver">

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                                <div class="mdc-text-field mdc-text-field--outlined">

                                                    <input class="mdc-text-field__input" id="id_pieza" type="text" name="id_pieza" value="${ver.id_pieza}">
                                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                        <div class="mdc-notched-outline__leading"></div>
                                                        <div class="mdc-notched-outline__notch" style="">
                                                            <label for="id_pieza" class="mdc-floating-label" style="">ID</label>
                                                        </div>
                                                        <div class="mdc-notched-outline__trailing"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                                <div class="mdc-text-field mdc-text-field--outlined">
                                                    <input class="mdc-text-field__input" id="tipo_pieza" type="text" name="tipo_pieza" value="${ver.tipo_pieza}">

                                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                        <div class="mdc-notched-outline__leading"></div>
                                                        <div class="mdc-notched-outline__notch" style="">
                                                            <label for="tipo_pieza" class="mdc-floating-label" style="">TIPO PIEZA</label>
                                                        </div>
                                                        <div class="mdc-notched-outline__trailing"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                                <div class="mdc-text-field mdc-text-field--outlined">

                                                    <input class="mdc-text-field__input" id="modelo" type="number" name="modelo" value="${ver.modelo}">
                                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                        <div class="mdc-notched-outline__leading"></div>
                                                        <div class="mdc-notched-outline__notch" style="">
                                                            <label for="modelo" class="mdc-floating-label" style="">MODELO</label>
                                                        </div>
                                                        <div class="mdc-notched-outline__trailing"></div>
                                                    </div>
                                                </div>
                                            </div>         

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                                <div class="mdc-text-field mdc-text-field--outlined">

                                                    <input class="mdc-text-field__input" id="precio" type="text" name="precio" value="${ver.precio}">
                                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                        <div class="mdc-notched-outline__leading"></div>
                                                        <div class="mdc-notched-outline__notch" style="">
                                                            <label for="precio" class="mdc-floating-label" style="">PRECIO</label>
                                                        </div>
                                                        <div class="mdc-notched-outline__trailing"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                                <div class="mdc-text-field mdc-text-field--outlined">
                                                    <input class="mdc-text-field__input" id="descripcion" type="text" name="descripcion" value="${ver.descripcion}">

                                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                        <div class="mdc-notched-outline__leading"></div>
                                                        <div class="mdc-notched-outline__notch" style="">
                                                            <label for="descripcion" class="mdc-floating-label" style="">DESCRIPCION</label>
                                                        </div>
                                                        <div class="mdc-notched-outline__trailing"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                                <div class="mdc-text-field mdc-text-field--outlined">
                                                    <input class="mdc-text-field__input" id="cantidad" type="number" name="cantidad" value="${ver.cantidad}">

                                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                        <div class="mdc-notched-outline__leading"></div>
                                                        <div class="mdc-notched-outline__notch" style="">
                                                            <label for="cantidad" class="mdc-floating-label" style="">CANTIDAD</label>
                                                        </div>
                                                        <div class="mdc-notched-outline__trailing"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">

                                                <div class="mdc-text-field mdc-text-field--outlined">
                                                    <select name="id_tipo" class="mdc-text-field__input">
                                                        <%-- convierte de JSTL a scriptlet //para poder hacer la conparación --%>
                                                        <c:set var="idTipo" value="${ver.id_tipo.id_tipo}"/>
                                                        <option>Seleccionar</option>
                                                        <% 
                                                            for (TipoPieza tp : tipopieza) {
                                                            if (tp.getId_tipo() == Integer.parseInt(pageContext.getAttribute("idTipo").toString()) ) { 
                                                        %>
                                                            <option value="<%=tp.getId_tipo()%>" selected><%=tp.getTipo_pieza()%><%=tp.getDescripcion()%></option>
                                                            
                                                            <% } else { %>
                                                            <option value="<%=tp.getId_tipo()%>"><%=tp.getTipo_pieza()%><%=tp.getDescripcion()%></option>
                                                            <% } %>
                                                        <% } %>
                                                    </select>
                                                    <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                        <div class="mdc-notched-outline__leading"></div>
                                                        <div class="mdc-notched-outline__notch" style="">
                                                            <label class="mdc-floating-label">TIPO DE PIEZA</label>
                                                        </div>
                                                        <div class="mdc-notched-outline__trailing"></div>
                                                    </div>
                                                </div>

                                            </div>
                                        </c:forEach>
                                    </div>

                                    <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-3-desktop">
                                        <button class="mdc-button mdc-button--outlined outlined-button--secondary mdc-ripple-upgraded" type="submit">Enviar</button>
                                        <a class="mdc-button mdc-button--outlined outlined-button--primary mdc-ripple-upgraded"  href="pieza?action=seleccionar">
                                            <i class="material-icons left">assignment</i>
                                            mostrar
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
