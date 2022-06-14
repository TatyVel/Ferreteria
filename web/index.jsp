<%-- 
    Document   : login
    Created on : 11-10-2021, 01:02:37 PM
    Author     : Kevins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Iniciar sesión</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- Layout styles -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo/style.css">
        <!-- End layout styles -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.png" />
    </head>
    <body>
        <script type="text/javascript">
            history.forward();
            if (history.forward(1)) {
                location.replace(history.forward(1));
            }
        </script>
        <script src="${pageContext.request.contextPath}/assets/js/preloader.js"></script>
        <div class="body-wrapper">
            <div class="main-wrapper">
                <div class="page-wrapper full-page-wrapper d-flex align-items-center justify-content-center">
                    <main class="auth-page">
                        <div class="mdc-layout-grid">
                            <div class="mdc-layout-grid__inner">
                                <div class="stretch-card mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-1-tablet"></div>
                                <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-6-tablet">
                                    <div class="mdc-card">
                                        <h6 class="card-title" style="text-align: center;">Iniciar sesión</h6>
                                        <form action="login?action=iniciar" method="post">
                                            <div class="mdc-layout-grid">
                                                <div class="mdc-layout-grid__inner">
                                                    <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
                                                        <div class="mdc-text-field w-100">
                                                            <input name="usuario" class="mdc-text-field__input" id="text-field-hero-input">
                                                            <div class="mdc-line-ripple"></div>
                                                            <label for="text-field-hero-input" class="mdc-floating-label">Username</label>
                                                        </div>
                                                    </div>
                                                    <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
                                                        <div class="mdc-text-field w-100">
                                                            <input name="clave" class="mdc-text-field__input" type="password" id="text-field-hero-input">
                                                            <div class="mdc-line-ripple"></div>
                                                            <label for="text-field-hero-input" class="mdc-floating-label">Contraseña</label>
                                                        </div>
                                                    </div>
                                                    <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop">
                                                        <div class="mdc-form-field">
                                                            <div class="mdc-checkbox">
                                                                <input type="checkbox"
                                                                       class="mdc-checkbox__native-control"
                                                                       id="checkbox-1"/>
                                                                <div class="mdc-checkbox__background">
                                                                    <svg class="mdc-checkbox__checkmark"
                                                                         viewBox="0 0 24 24">
                                                                    <path class="mdc-checkbox__checkmark-path"
                                                                          fill="none"
                                                                          d="M1.73,12.91 8.1,19.28 22.79,4.59"/>
                                                                    </svg>
                                                                    <div class="mdc-checkbox__mixedmark"></div>
                                                                </div>
                                                            </div>
                                                            <label for="checkbox-1">Recuérdame</label>
                                                        </div>
                                                    </div>
                                                    <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop d-flex align-items-center justify-content-end">
                                                        <a href="#">Has olvidado tu contraseña</a>
                                                    </div>

                                                    <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
                                                        <center><span style="color: red; text-align: center">${msg}</span></center>
                                                    </div>
                                                    <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
                                                        <button type="submit" class="mdc-button mdc-button--raised w-100">Entrar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="stretch-card mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-1-tablet"></div>
                            </div>
                        </div>
                    </main>
                </div>
            </div>
        </div>
        <!-- plugins:js -->
        <script src="${pageContext.request.contextPath}/assets/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page-->
        <!-- End plugin js for this page-->
        <!-- inject:js -->
        <script src="${pageContext.request.contextPath}/assets/js/material.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/misc.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <!-- End custom js for this page-->
    </body>
</html>