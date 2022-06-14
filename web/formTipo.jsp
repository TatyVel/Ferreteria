<%-- 
    Document   : formTipo
    Created on : 10-20-2021, 04:50:24 PM
    Author     : Alexis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo tipo de pieza</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>
        <main class="content-wrapper">
            <form action="tipo?action=insertar" method="POST">
                <div class="mdc-layout-grid">
                    <div class="mdc-layout-grid__inner">
                        <div class="mdc-layout-grid__cell--span-12">
                            <div class="mdc-card">
                                <div class="card">
                                    <div class="card-content blue-text">
                                        <h6 class="card-title">Nuevo tipo de pieza</h6>
                                        <div class="template-demo">
                                            <div class="mdc-layout-grid__inner">

                                                <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                                    <div class="mdc-text-field mdc-text-field--outlined">

                                                        <input class="mdc-text-field__input" id="tipo" type="text" name="tipo">
                                                        <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                            <div class="mdc-notched-outline__leading"></div>
                                                            <div class="mdc-notched-outline__notch" style="">
                                                                <label for="tipo" class="mdc-floating-label" style="">TIPO DE PIEZA:</label>
                                                            </div>
                                                            <div class="mdc-notched-outline__trailing"></div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                                    <div class="mdc-text-field mdc-text-field--outlined">
                                                        <input class="mdc-text-field__input" id="descripcion" type="text" name="descripcion">

                                                        <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                            <div class="mdc-notched-outline__leading"></div>
                                                            <div class="mdc-notched-outline__notch" style="">
                                                                <label for="descripcion" class="mdc-floating-label" style="">DESCRIPCIÓN</label>
                                                            </div>
                                                            <div class="mdc-notched-outline__trailing"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                
                                                <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-3-desktop">
                                                    <button type="submit" class="mdc-button mdc-button--outlined outlined-button--secondary mdc-ripple-upgraded">Enviar</button>

                                                    <a class="mdc-button mdc-button--outlined outlined-button--primary mdc-ripple-upgraded" href="tipo?action=seleccionar">
                                                        <i class="material-icons left">assignment</i>
                                                        Mostrar
                                                    </a>
                                                </div> 
                                            </div>
                                        </div>
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
