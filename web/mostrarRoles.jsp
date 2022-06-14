<%-- 
    Document   : mostrarRoles
    Created on : 18-nov-2021, 21:37:54
    Author     : Chiquillo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Roles</title>
         <%@include file="Template/_Header.jsp" %>
    </head>
    <main class="content-wrapper">
            <div class="container">
                <h3>Registro de Usuarios</h3>
                <br>
                <a href="${pageContext.request.contextPath}/insertRoles.jsp" class="mdc-button mdc-menu-button mdc-button--raised icon-button shaped-button warning-filled-button mdc-ripple-upgraded">
                    <i class="material-icons mdc-button__icon">add</i>
                </a>
                <div class="table-responsive">
                    <table class="table table-striped table-hoverable" style="background-color: whitesmoke;">
                        <thead>
                            <tr>
                                <th class="text-left">ID</th>
                                <th class="text-left">Nombre Rol</th>
                                <th class="text-left">Crear</th>
                                <th class="text-left">Actualizar</th>
                                <th class="text-left">Eliminar</th>
                                <th class="text-left">Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${lista}" var="ver">
                                <tr class="text-left">
                                    <td class="text-left">${ver.id_rol}</td>
                                    <td class="text-left">${ver.nombre_rol}</td>
                                    <td class="text-left">${ver.crear}</td>
                                    <td class="text-left">${ver.actualizar}</td>
                                    <td class="text-left">${ver.eliminar}</td>
                                    <td class="text-left">
                                        <a class="material-icons mdc-typography mdc-theme--secondary" href="roles?action=eliminar&id=${ver.id_rol}">delete_sweep</a>
                                        <a class="material-icons mdc-typography mdc-theme--info" href="roles?action=seleccionarById&id=${ver.id_rol}">create</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
        <%@include file="Template/_Footer.jsp" %>
</html>
