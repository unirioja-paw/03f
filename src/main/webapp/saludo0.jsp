<%-- 

  Pone manualmente el locale 

--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAW</title>

    </head>
    <body>
        <!--El locale a usar será el frances de Francia fr_FR-->
        <fmt:setLocale value="fr_FR"></fmt:setLocale>
        <!--
        As a result of using this action, browser-based locale setting capabilities are disabled.
        (JSTL spec) 
        -->


        <!--El fichero bundle usado será mensajes_fr_FR.properties-->
        <fmt:setBundle basename="mensajes"></fmt:setBundle>

            <!--Dentro del fichero bundle el valor asociado a la clave "saludo" es Salut! Comment êtes-vous?-->
            <h1><fmt:message key="saludo"/></h1>

    </body>
</html>
