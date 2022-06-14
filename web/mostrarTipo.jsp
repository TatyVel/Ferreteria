<%-- 
    Document   : mostrarTipo
    Created on : 10-20-2021, 05:15:24 PM
    Author     : Alexis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tipo de piezas</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body> 
        <main class="content-wrapper">
            <div class="container">
                <h3>Registro de Tipos de Piezas</h3>
                <br>
                <a href="${pageContext.request.contextPath}/formTipo.jsp" class="mdc-button mdc-menu-button mdc-button--raised icon-button shaped-button warning-filled-button mdc-ripple-upgraded">
                    <i class="material-icons mdc-button__icon">add</i>
                </a>
                <div class="table-responsive">
                    <table class="table table-striped table-hoverable" style="background-color: whitesmoke;">
                        <thead>
                            <tr>
                                <th class="text-left">ID</th>
                                <th class="text-left">Tipo Pieza</th>
                                <th class="text-left">Descripcion</th>
                                <th class="text-left">Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${lista}" var="ver">
                                <tr class="text-left">
                                    <td class="text-left">${ver.id_tipo}</td>
                                    <td class="text-left">${ver.tipo_pieza}</td>
                                    <td class="text-left">${ver.descripcion}</td>
                                    <td class="text-left">
                                        <a class="material-icons mdc-typography mdc-theme--secondary" href="tipo?action=eliminar&id=${ver.id_tipo}">delete_sweep</a>
                                        <a class="material-icons mdc-typography mdc-theme--info" href="tipo?action=seleccionarById&id=${ver.id_tipo}">create</a>
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
