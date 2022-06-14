<%-- 
    Document   : PiezaMostrar
    Created on : 21-oct-2021, 0:29:37
    Author     : Chiquillo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Piezas</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>
        <div class="content-wrapper">
            <div class="container">

                <h3>Registro de Piezas</h3>
                <a href="${pageContext.request.contextPath}/PiezaForm.jsp" class="mdc-button mdc-menu-button mdc-button--raised icon-button shaped-button warning-filled-button mdc-ripple-upgraded">
                    <i class="material-icons mdc-button__icon">add</i>
                </a>

                <div class="table-responsive" style="background-color: whitesmoke;">
                    <table class="table table-striped table-hoverable">
                        <thead>
                            <tr>
                                <th class="text-left">ID</th>
                                <th class="text-left">Tipo de pieza</th>
                                <th class="text-left">Modelo</th>
                                <th class="text-left">Precio</th>
                                <th class="text-left">Descripción</th>
                                <th class="text-left">Centidad</th>
                                <th class="text-left">Tipo de pieza</th>
                                <th class="text-left">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${lista}" var="ver">
                                <tr class="text-left">
                                    <td class="text-left">${ver.id_pieza}</td>
                                    <td class="text-left">${ver.tipo_pieza}</td>
                                    <td class="text-left">${ver.modelo}</td>
                                    <td class="text-left">${ver.precio}</td>
                                    <td class="text-left">${ver.descripcion}</td>
                                    <td class="text-left">${ver.cantidad}</td>
                                    <td class="text-left">${ver.id_tipo.getTipo_pieza()}</td> <%-- el getter que tiene nuestro parametro --%>
                                    <td class="text-left">
                                        <a class="material-icons mdc-typography mdc-theme--secondary" href="pieza?action=eliminar&id=${ver.id_pieza}">
                                            delete_sweep
                                        </a>
                                        <a class="material-icons mdc-typography mdc-theme--info" href="pieza?action=seleccionarById&id=${ver.id_pieza}">
                                            create
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    <%@include file="Template/_Footer.jsp" %>
</body>
</html>
