<%-- 
    Document   : insertUsuario
    Created on : 11-17-2021, 10:46:55 PM
    Author     : Kevins
--%>

<%@page import="modelo.Rol"%>
<%@page import="dao.RolDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    RolDao roldao = new RolDao(new Conexion());
    List<Rol> rol = roldao.getAllRoles();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo usuario</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>
        <main class="content-wrapper">
            <form action="usuarios?action=insertarUsuario" method="POST">
                <div class="mdc-layout-grid">
                    <div class="mdc-layout-grid__inner">
                        <div class="mdc-layout-grid__cell--span-12">
                            <div class="mdc-card">
                                <h6 class="card-title">Registro de usuario</h6>
                                <div class="template-demo">
                                    <div class="mdc-layout-grid__inner">

                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">
                                                <input class="mdc-text-field__input" type="text" id="nombres" name="nombres">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="nombres" class="mdc-floating-label" style="">NOMBRES</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">
                                                <input class="mdc-text-field__input" type="text" name="apellidos">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="apellidos" class="mdc-floating-label">APELLIDOS</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">
                                                <input class="mdc-text-field__input" type="text" name="usuario">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="usuario" class="mdc-floating-label">USUARIO</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">

                                                <input class="mdc-text-field__input" type="text" name="clave">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="clave" class="mdc-floating-label">CLAVE</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">

                                                <input class="mdc-text-field__input" type="text" name="pregunta">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="pregunta" class="mdc-floating-label">PREGUNTA DE RECUPERACIÓN</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                            <div class="mdc-text-field mdc-text-field--outlined">

                                                <input class="mdc-text-field__input" type="text" name="respuesta">
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label for="respuesta" class="mdc-floating-label">RESPUESTA DE RECUPERACIÓN</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">

                                            <div class="mdc-text-field mdc-text-field--outlined">
                                                <select name="id_rol" class="mdc-text-field__input">
                                                    <option>Seleccionar</option>
                                                    <% for (Rol r : rol) {%>
                                                    <option value="<%=r.getId_rol()%>"><%=r.getNombre_rol()%></option>
                                                    <% }%>
                                                </select>
                                                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                                    <div class="mdc-notched-outline__leading"></div>
                                                    <div class="mdc-notched-outline__notch" style="">
                                                        <label class="mdc-floating-label">ROL</label>
                                                    </div>
                                                    <div class="mdc-notched-outline__trailing"></div>
                                                </div>
                                            </div>

                                        </div> 



                                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12-desktop">
                                            <button class="mdc-button mdc-button--outlined outlined-button--secondary mdc-ripple-upgraded" type="submit">Enviar</button> 
                                            <a class="mdc-button mdc-button--outlined outlined-button--primary mdc-ripple-upgraded" href="usuarios?action=view">
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
        <%@include file="Template/_Footer.jsp" %>
    </body>
</html>
