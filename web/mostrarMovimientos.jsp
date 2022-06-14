<%-- 
    Document   : mostrarMovimientos
    Created on : 10-21-2021, 02:08:53 PM
    Author     : Kevins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movimientos</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>
        <main class="content-wrapper">
            <div class="container">
                <h3>Registros de movimientos</h3>

                <a href="${pageContext.request.contextPath}/movimientoForm.jsp" class="mdc-button mdc-menu-button mdc-button--raised icon-button shaped-button warning-filled-button mdc-ripple-upgraded">
                    <i class="material-icons mdc-button__icon">add</i>
                </a>
                <div class="table-responsive">
                    <table class="table table-striped table-hoverable" style="background-color: whitesmoke;">
                        <thead>
                            <tr>
                                <th class="text-left">ID</th>
                                <th class="text-left">Tipo de pieza</th>
                                <th class="text-left">Modelo Pieza</th>
                                <th class="text-left">Descripción Pieza</th>
                                <th class="text-left">Número de almacen</th>
                                <th class="text-left">Almacen</th>
                                <th class="text-left">Descripción</th>
                                <th class="text-left">Usuario</th>
                                <th class="text-left">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${lista}" var="ver">
                                <tr class="text-left">
                                    <td class="text-left">${ver.id_movimientos}</td>
                                    <td class="text-left">${ver.id_pieza.getTipo_pieza()}</td>
                                    <td class="text-left">${ver.id_pieza.getModelo()}</td>
                                    <td class="text-left">${ver.id_pieza.getDescripcion()}</td>
                                    <td class="text-left">${ver.id_almacen.getNum_almacen()}</td>
                                    <td class="text-left">${ver.id_almacen.getNombre_estanteria()}</td>                            
                                    <td class="text-left">${ver.id_almacen.getDescripcion()}</td>
                                    <td class="text-left">${ver.id_usuario.getUsuario()}</td>
                                    <td class="text-left">
                                        <a  href="movimiento?action=eliminar&id_movimientos=${ver.id_movimientos}" class="material-icons mdc-typography mdc-theme--secondary">
                                            delete_sweep
                                        </a>
                                        <a href="movimiento?action=seleccionarById&id_movimientos=${ver.id_movimientos}" class="material-icons mdc-typography mdc-theme--info">create</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>

        <%@include file="Template/_Footer.jsp" %>
    </body>
</html>
