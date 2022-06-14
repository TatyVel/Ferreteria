

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <%@include file="Template/header.jsp" %>
    </head>
    <body>

        <h1>¡Hola, <%=sesion.getAttribute("usuario").toString()%>!</h1>
        <h1>¡rol, <%=sesion.getAttribute("rol").toString()%>!</h1>
        <div class="col s12 m7">

            <div class="carousel carousel-slider">
                <a class="carousel-item" ><img src="image/tornillos.jpg"></a>

                <a class="carousel-item" ><img src="image/perno.jpg"></a>
                <a class="carousel-item" ><img src="image/im.jpg"></a>
            </div> 
        </div>



        <div class="col s12 m7">

            <div class="card horizontal">
                <div class="header">
                </div>

                <div class="card-image">
                    <img src="image/martillo.jpg" style="width: 292px; height: 185px;">
                </div>
                <div class="card-stacked">
                    <div class="card-content">
                        <p>Lorem ipsum dolor sit amet. Aut adipisci debitis et galisum culpa 33 voluptate galisum est magnam omnis et facere officia et quam provident eum esse laudantium. Est aspernatur doloremque a vitae nihil et impedit repellendus vel vitae porro!
                        </p>
                    </div>

                </div>
            </div>
        </div>





        <div class="container">
            <div class="row">
                <div class="col s7 m4">
                    <div class="card">
                        <div class="card-image">
                            <img src="image/tornillos2.jpg" style="width: 292px; height: 185px;">
                            <span class="card-title">Producto</span>
                        </div>
                        <div class="card-content">
                            <p>I am a very simple card. I am good at containing small bits of information.
                                I am convenient because I require little markup to use effectively.</p>

                        </div>
                        <div class="card-action">
                            <a href="#">Lorem ipsum dolor sit amet</a>
                        </div>
                    </div>


                </div>


                <div class="col s7 m4">
                    <div class="card">
                        <div class="card-image">
                            <img src="image/destornillador.jpg" style="width: 292px; height: 185px;">
                            <span class="card-title">Producto</span>
                        </div>
                        <div class="card-content">
                            <p>I am a very simple card. I am good at containing small bits of information.
                                I am convenient because I require little markup to use effectively.</p>

                        </div>
                        <div class="card-action">
                            <a href="#">Lorem ipsum dolor sit amet</a>
                        </div>
                    </div>


                </div>

                <div class="col s7 m4">
                    <div class="card">
                        <div class="card-image">
                            <img src="image/herramientas.jpg" style="width: 292px; height: 185px;">
                            <span class="card-title">Producto</span>
                        </div>
                        <div class="card-content">
                            <p>I am a very simple card. I am good at containing small bits of information.
                                I am convenient because I require little markup to use effectively.</p>

                        </div>
                        <div class="card-action">
                            <a href="#">Lorem ipsum dolor sit amet</a>
                        </div>
                    </div>


                </div>
            </div> 
        </div>   

        <%

        %>







        <%@include file="Template/footer.jsp" %>

        <script>
            $('.carousel.carousel-slider').carousel({

                fullWidth: true

            });
        </script>

    </body>
</html>
