<%-- 
    Document   : Almacen
    Created on : 10-20-2021, 06:00:18 PM
    Author     : tatiana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="v" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Almacenes</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>

        <main class="content-wrapper">
            <div class="container">
                <h3>Listado de Almacenes</h3>

                <a href="${pageContext.request.contextPath}/InsertAlmacen.jsp" class="mdc-button mdc-menu-button mdc-button--raised icon-button shaped-button warning-filled-button mdc-ripple-upgraded">
                    <i class="material-icons mdc-button__icon">add</i>
                </a>
                
                <div class="table-responsive">
                    <table class="table table-striped table-hoverable" style="background-color: whitesmoke;">
                        <thead>
                            <tr>
                                <th class="text-left">ID</th>
                                <th class="text-left">Numero de Almacen</th>
                                <th class="text-left">Descripcion</th>
                                <th class="text-left">Direccion</th>
                                <th class="text-left">Nombre de estanteria</th>
                                <th class="text-left">Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <v:forEach items="${listAlmacen}" var ="al">
                                <tr class="text-left">
                                    <td class="text-left">${al.id_almacen}</td>
                                    <td class="text-left">${al.num_almacen}</td>
                                    <td class="text-left">${al.descripcion}</td>
                                    <td class="text-left">${al.direccion}</td>
                                    <td class="text-left">${al.nombre_estanteria}</td>
                                    <td class="text-left">
                                        <a  href="almacen?action=DeleteAlmacen&id_almacen=${al.id_almacen}" class="material-icons mdc-typography mdc-theme--secondary">
                                            delete_sweep
                                        </a>
                                        <a href="almacen?action=getByIdAlmacen&id_almacen=${al.id_almacen}" class="material-icons mdc-typography mdc-theme--info">
                                            create
                                        </a>  
                                    </td>
                                </tr>
                            </v:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
        ${msg}
        <%@include file="Template/_Footer.jsp" %>
    </body>
</html>
