<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
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

        <%

            pageContext.setAttribute("now", new Date());
            pageContext.setAttribute("nowAsCalendar", Calendar.getInstance());
        %>

        <h1>Ejemplos de formateo de fechas y horas</h1>

        <section>
            <h2>fmt:formatDat java.util.Date</h2>
            Formato por defecto <fmt:formatDate value="${now}"/>
            <br>
            Fecha solo en formato definido dd/MM/yyyy :
            <fmt:formatDate value="${now}" type="date" pattern="dd/MM/yyyy"/>
            <br>
            Fecha solo en formato SHORT :
            <fmt:formatDate value="${now}" type="date" dateStyle="short"/>
            <br>
            Hora solo en formato MEDIUM :
            <fmt:formatDate value="${now}" type="time" dateStyle="medium"/>
            <br>
            Fecha y Hora en formato FULL :
            <fmt:formatDate value="${now}" type="BOTH" dateStyle="FULL" timeStyle="FULL"/>
            <br>
        </section>


        <section>
            <h2>fmt:formatDat java.util.Calendar</h2>
            Formato por defecto <fmt:formatDate value="${nowAsCalendar.time}"/>
            <br>
            Fecha solo en formato definido dd/MM/yyyy :
            <fmt:formatDate value="${nowAsCalendar.time}" type="date" pattern="dd/MM/yyyy"/>
            <br>
            Fecha solo en formato SHORT :
            <fmt:formatDate value="${nowAsCalendar.time}" type="date" dateStyle="short"/>
            <br>

        </section>


        <section>
            <h2>fmt:parseDate</h2>
            <fmt:parseDate value="${param.crashDate}" pattern="dd/MM/yyyy" var="parsedDate" />

            Fecha parseada:
            <div style="font-size: 32px; font-weight: bold;">
                <fmt:formatDate value="${parsedDate}" type="date" dateStyle="FULL"/>
            </div>
            <c:if test="${parsedDate != null}">
                <div>
                    <img src="https://upload.wikimedia.org/wikipedia/commons/e/e1/Crowd_outside_nyse.jpg" alt="Crowd gathering on Wall Street after the 1929 crash" />

                    <div>
                        <a href="https://commons.wikimedia.org/wiki/File:Crowd_outside_nyse.jpg">US-gov</a>, Public domain, via Wikimedia Commons
                    </div>
                </div>
            </c:if>

        </section>



    </body>
</html>        