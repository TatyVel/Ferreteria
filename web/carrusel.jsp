<%-- 
    Document   : carrusel
    Created on : 11-10-2021, 02:19:26 PM
    Author     : Kevins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link href="${pageContext.request.contextPath}/assets/carrusel/carrusel.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <!-- partial:index.partial.html -->
        <ul class="gallery">
            <li style="background: #f6bd60;"></li>
            <li style="background: #f7ede2;"></li>
            <li style="background: #f5cac3;"></li>
            <li style="background: #84a59d;"></li>
            <li style="background: #f28482;"></li>
        </ul>
        <!-- partial -->
        <script src="${pageContext.request.contextPath}/assets/carrusel/carrusel.js" type="text/javascript"></script>
    </body>
</html>