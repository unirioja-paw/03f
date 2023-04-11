<%-- 

  Coge el locale del navegador (o de la sesión, si es que alguna página anterior lo hubiese puesto en la sesion)
  
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAW</title>
    </head>
    <body>
        <!--No se especifica locale, por lo que lo coge de la cabecera Accept-languaje-->
        <!--El nombre base del fichero bundle a usar es "mensajes"-->
        <fmt:setBundle basename="mensajes"></fmt:setBundle>

            <h1><fmt:message key="saludo"/></h1>

        <p>Para ver el efecto, cambia las preferencias de idioma y recarga la página.</p>

        
        
<!--        <p>
            Request Locale:
            <strong>${pageContext.request.locale}</strong>
        </p>
        <p>
            Response Locale:
            <strong>${pageContext.response.locale}</strong>
        </p>-->

    </body>
</html>
