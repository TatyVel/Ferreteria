<%-- 
    Document   : mostrarUsuarios
    Created on : 11-17-2021, 10:13:25 PM
    Author     : Kevins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>
        <main class="content-wrapper">
            <div class="container">
                <h3>Registro de Usuarios</h3>
                <br>
                <a href="${pageContext.request.contextPath}/insertUsuario.jsp" class="mdc-button mdc-menu-button mdc-button--raised icon-button shaped-button warning-filled-button mdc-ripple-upgraded">
                    <i class="material-icons mdc-button__icon">add</i>
                </a>
                <div class="table-responsive">
                    <table class="table table-striped table-hoverable" style="background-color: whitesmoke;">
                        <thead>
                            <tr>
                                <th class="text-left">ID</th>
                                <th class="text-left">Nombres</th>
                                <th class="text-left">Apellidos</th>
                                <th class="text-left">Usuario</th>
                                <th class="text-left">Id rol</th>
                                <th class="text-left">Nombre del rol</th>
                                <th class="text-left">Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${lista}" var="ver">
                                <tr class="text-left">
                                    <td class="text-left">${ver.id_usuario}</td>
                                    <td class="text-left">${ver.nombres}</td>
                                    <td class="text-left">${ver.apellidos}</td>
                                    <td class="text-left">${ver.usuario}</td>
                                    <td class="text-left">${ver.rol.getId_rol()}</td>
                                    <td class="text-left">${ver.rol.getNombre_rol()}</td>
                                    <td class="text-left">
                                        <a class="material-icons mdc-typography mdc-theme--secondary" href="usuarios?action=eliminar&id=${ver.id_usuario}">delete_sweep</a>
                                        <a class="material-icons mdc-typography mdc-theme--info" href="usuarios?action=seleccionarById&id=${ver.id_usuario}">create</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${msgI != null}">
                        <div class="mdc-card bg-success text-white">
                            <center><span class="font-weight-normal mt-2">${msgI}</span></center>
                        </div>
                    </c:if>
                    <c:if test="${msgD != null}">
                        <div class="mdc-card bg-danger text-white">
                            <center><span class="font-weight-normal mt-2">${msgD}</span></center>
                        </div>
                    </c:if>
                    <c:if test="${msgU != null}">
                        <div class="mdc-card bg-info text-white">
                            <center><span class="font-weight-normal mt-2">${msgU}</span></center>
                        </div>
                    </c:if>
                </div>
            </div>
        </main>
        <%@include file="Template/_Footer.jsp" %>
    </body>
</html>
