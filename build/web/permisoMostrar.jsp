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
        <title>Permisos</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>
        <main class="content-wrapper">
            <div class="container">
                <h3>Registros de Permisos</h3>

                <a href="${pageContext.request.contextPath}/permisoInsertar.jsp" class="mdc-button mdc-menu-button mdc-button--raised icon-button shaped-button warning-filled-button mdc-ripple-upgraded">
                    <i class="material-icons mdc-button__icon">add</i>
                </a>
                <div class="table-responsive">
                    <table class="table table-striped table-hoverable" style="background-color: whitesmoke;">
                        <thead>
                            <tr>
                                <th class="text-left">ID</th>
                                <th class="text-left">Rol</th>
                                <th class="text-left">Modulo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${lista}" var="ver">
                                <tr class="text-left">
                                    <td class="text-left">${ver.id_rol_menu}</td>
                                    <td class="text-left">${ver.id_rol.getNombre_rol()}</td>
                                    <td class="text-left">${ver.id_menu.getNombre_modulo()}</td>
                                    <td class="text-left">
                                        <a  href="permiso?action=eliminar&id_rol_menu=${ver.id_rol_menu}" class="material-icons mdc-typography mdc-theme--secondary">
                                            delete_sweep
                                        </a>
                                        <a href="permiso?action=seleccionarById&id_rol_menu=${ver.id_rol_menu}" class="material-icons mdc-typography mdc-theme--info">create</a>
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
