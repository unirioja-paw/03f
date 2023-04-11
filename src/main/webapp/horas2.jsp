<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAW</title>
    </head>
    <body>

        <%
            pageContext.setAttribute("fechaCierre", Calendar.getInstance());
            pageContext.setAttribute("now", new Date());
        %>

        <h1>Ejemplos de formateo de fechas y horas</h1>


        <section>
            <h2>Con Time Zone por defecto</H2>
            Formato por defecto <fmt:formatDate value="${now}"/><br>
            Fecha solo en formato definido dd/MM/yyyy :
            <fmt:formatDate value="${now}" type="DATE" pattern="dd/MM/yyyy"/><br>
            Hora solo en formato MEDIUM :
            <fmt:formatDate value="${now}" type="TIME" dateStyle="MEDIUM"/><br>
            Fecha y Hora en formato FULL :
            <fmt:formatDate value="${now}" type="BOTH" dateStyle="FULL" timeStyle="FULL"/><br>
        </section>

        <section>
            <h2>Con Time Zone America/Los_Angeles</h2>
            <fmt:timeZone value="America/Los_Angeles">
                <%-- Prueba a descomentar la siguiente lÃ­nea para ver las fechas en formato inglÃ©s, ademÃ¡s de con la zona horaria de LA --%>
                <%-- <fmt:setLocale value="en_US"/> --%>
                Formato por defecto <fmt:formatDate value="${now}"/><br>
                Fecha solo en formato definido MM-dd-yyyy :
                <fmt:formatDate value="${now}" type="DATE" pattern="MM-dd-yyyy"/><br>
                Hora solo en formato MEDIUM :
                <fmt:formatDate value="${now}" type="TIME" dateStyle="MEDIUM"/><br>
                Fecha y Hora en formato FULL :
                <fmt:formatDate value="${now}" type="BOTH" dateStyle="FULL" timeStyle="FULL"/><br>
            </fmt:timeZone>


            <!--Los mensajes salen en el locale (por elegir una zona horaria americana, no se pone un locale americano)-->
        </section>

    </body>
</html>                