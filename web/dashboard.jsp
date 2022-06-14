<%-- 
    Document   : dashboard
    Created on : 11-10-2021, 01:27:52 PM
    Author     : Kevins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <%@include file="Template/_Header.jsp" %>
    </head>
    <body>
        <div class="page-wrapper mdc-toolbar-fixed-adjust">
            <main class="content-wrapper">

                <main>
                    <section class="has-dflex-center">
                        <div class="lx-container-80">
                            <div class="lx-row">
                                <div class="lx-card carousel-container">
                                    <div class="item fade">
                                        <div class="image"><img src="image/tornillos.jpg"/></div>
                                    </div>
                                    <div class="item fade">
                                        <div class="image"><img src="image/perno.jpg"/></div>
                                        <div class="text is-text-left">
                                            <h1 class="title"> <i class="far fa-hand-point-right"></i>&nbsp;This item has a title.</h1>
                                            <p>This item has a caption, aligned to the left.</p>
                                        </div>
                                    </div>
                                    <div class="item fade">
                                        <div class="image"><img src="image/im.jpg"/></div>
                                        <div class="text is-text-centered">
                                            <p> <i class="fas fa-info-circle"></i>&nbsp;This item has a caption, aligned to the center.</p>
                                        </div>
                                    </div><a class="prev has-dflex-center"><i class="fas fa-angle-left"></i></a><a class="next has-dflex-center"><i class="fas fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </section>
                </main>


                <div class="mdc-layout-grid">

                    <div class="mdc-layout-grid__inner">
                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop mdc-layout-grid__cell--span-4-tablet">
                            <div class="mdc-card bg-primary text-white">
                                <img src="image/martillo.jpg" style="width: auto; height: 185px;">
                                <br>
                                <div class="d-flex">
                                    <p >
                                        Lorem ipsum dolor sit amet. Aut adipisci debitis et galisum culpa 33 voluptate galisum est magnam omnis et facere officia et quam provident eum esse laudantium. Est aspernatur doloremque a vitae nihil et impedit repellendus vel vitae porro!
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-6-desktop mdc-layout-grid__cell--span-4-tablet">
                            <div class="mdc-card bg-info text-white">
                                <img src="image/martillo.jpg" style="width: auto; height: 185px;">
                                <br>
                                <div class="d-flex">
                                    <p >
                                        Lorem ipsum dolor sit amet. Aut adipisci debitis et galisum culpa 33 voluptate galisum est magnam omnis et facere officia et quam provident eum esse laudantium. Est aspernatur doloremque a vitae nihil et impedit repellendus vel vitae porro!
                                    </p>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="mdc-layout-grid">
                    <div class="mdc-layout-grid__inner">

                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-4-tablet">
                            <div class="mdc-card bg-white text-black">
                                <h6 class="card-title">Producto 1</h6>
                                <img src="image/tornillos2.jpg" style="width: auto; height: 185px;">
                                <br>
                                <div class="d-flex">
                                    <p class="mdc-typography mdc-theme--info">
                                        Lorem ipsum dolor sit amet. Aut adipisci debitis et galisum culpa 33 voluptate galisum est magnam omnis et facere officia et quam provident eum esse laudantium. Est aspernatur doloremque a vitae nihil et impedit repellendus vel vitae porro!
                                    </p>
                                </div>

                                <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-4-desktop">
                                    <a class="mdc-button mdc-button--outlined outlined-button--secondary mdc-ripple-upgraded" href="#">
                                        orem ipsum dolor sit amet
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-4-tablet">
                            <div class="mdc-card bg-white text-black">
                                <h6 class="card-title">Producto 2</h6>
                                <img src="image/destornillador.jpg" style="width: auto; height: 185px;">
                                <br>
                                <div class="d-flex">
                                    <p class="mdc-typography mdc-theme--secondary">
                                        Lorem ipsum dolor sit amet. Aut adipisci debitis et galisum culpa 33 voluptate galisum est magnam omnis et facere officia et quam provident eum esse laudantium. Est aspernatur doloremque a vitae nihil et impedit repellendus vel vitae porro!
                                    </p>
                                </div>

                                <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-4-desktop">
                                    <a class="mdc-button mdc-button--outlined outlined-button--primary mdc-ripple-upgraded" href="#">
                                        orem ipsum dolor sit amet
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-4-desktop mdc-layout-grid__cell--span-4-tablet">
                            <div class="mdc-card bg-white text-black">
                                <h6 class="card-title">Producto 3</h6>
                                <img src="image/herramientas.jpg" style="width: auto; height: 185px;">
                                <br>
                                <div class="d-flex">
                                    <p class="mdc-typography mdc-theme--primary">
                                        Lorem ipsum dolor sit amet. Aut adipisci debitis et galisum culpa 33 voluptate galisum est magnam omnis et facere officia et quam provident eum esse laudantium. Est aspernatur doloremque a vitae nihil et impedit repellendus vel vitae porro!
                                    </p>
                                </div>

                                <div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-4-desktop">
                                    <a class="mdc-button mdc-button--outlined outlined-button--danger mdc-ripple-upgraded" href="#">
                                        orem ipsum dolor sit amet
                                    </a>
                                </div>
                            </div>
                        </div>



                    </div>
                </div>


            </main>
        </div>

        <%@include file="Template/_Footer.jsp" %>
    </body>
</html>
