<%-- 
    Document   : insertRoles
    Created on : 18-nov-2021, 22:20:49
    Author     : Chiquillo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Rol</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>
        
        <main class="content-wrapper">
            <form action="roles?action=insertarRoles" method="POST" autocomplete="off">
                <div class="mdc-layout-grid">
                    <div class="mdc-layout-grid__inner">
                        <div class="mdc-layout-grid__cell--span-12">
                            <div class="mdc-card">
                                <h6 class="card-title">Registro de Rol</h6>
                                <div class="template-demo">
                                    <div class="mdc-layout-grid__inner">

                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">
                                                <input class="mdc-text-field__input" type="text" id="nombres" name="nombreRol">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="nombreRol" class="mdc-floating-label" style="">Nombre del Rol</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">
                                                <input class="mdc-text-field__input" type="text" name="crear">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="crear" class="mdc-floating-label">CREAR</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">
                                                <input class="mdc-text-field__input" type="text" name="actualizar">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="actualizar" class="mdc-floating-label">ACTUALIZAR</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">

                                                <input class="mdc-text-field__input" type="text" name="eliminar">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="eliminar" class="mdc-floating-label">ELIMINAR</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12-desktop">
                                            <button class="mdc-button mdc-button--outlined outlined-button--secondary mdc-ripple-upgraded" type="submit">Enviar</button> 
                                            <a class="mdc-button mdc-button--outlined outlined-button--primary mdc-ripple-upgraded" href="roles?action=view">
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
            </form>
        </main>
        ${msg}


        <%@include file="Template/_Footer.jsp" %>
    </body>
</html>
