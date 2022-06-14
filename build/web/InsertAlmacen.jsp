<%-- 
    Document   : InsertAlmacen
    Created on : 10-20-2021, 05:50:53 PM
    Author     : tatiana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo almacen</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>
        
        <main class="content-wrapper">
            <form action="almacen?action=InsertAlmacen" method="POST">
                <div class="mdc-layout-grid">
                    <div class="mdc-layout-grid__inner">
                        <div class="mdc-layout-grid__cell--span-12">
                            <div class="mdc-card">
                                <h6 class="card-title">Registro de almacen</h6>
                                <div class="template-demo">
                                    <div class="mdc-layout-grid__inner">

                                        <%-- Número de almacen Text input --%>
                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">
                                                <input class="mdc-text-field__input" id="num_almacen" type="number" name="num_almacen">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="num_almacen" class="mdc-floating-label" style="">Número de almacen</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Text input final --%>

                                        <%-- Descripción Text input --%>
                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">
                                                <input class="mdc-text-field__input" id="descripcion" name="descripcion" type="text">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="descripcion" class="mdc-floating-label" style="">Descripción</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Text input final --%>

                                        <%-- Direccion Text input --%>
                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">
                                                <input class="mdc-text-field__input" id="direccion" name="direccion" type="text">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="direccion" class="mdc-floating-label" style="">Dirección</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Text input final --%>

                                        <%-- Nombre de estanteria Text input --%>
                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">
                                                <input class="mdc-text-field__input" id="nombre_estanteria" name="nombre_estanteria" type="text">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="nombre_estanteria" class="mdc-floating-label" style="">Nombre estanteria</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Text input final --%>


                                        <%-- Action card --%>
                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-3-desktop">
                                            <%-- Boton de enviar --%>
                                            <button type="submit" class="mdc-button mdc-button--outlined outlined-button--secondary mdc-ripple-upgraded">
                                                Enviar
                                            </button>
                                            <%-- Boton de mostrar --%>
                                            <a class="mdc-button mdc-button--outlined outlined-button--primary mdc-ripple-upgraded" href="almacen?action=getAllAlmacen">
                                                <i class="material-icons left">assignment</i>
                                                Mostrar
                                            </a>
                                        </div>
                                        <%-- Action card end --%>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </main>
        ${msg}
        <br/>

        
        <%@include file="Template/_Footer.jsp" %>
    </body>
</html>
