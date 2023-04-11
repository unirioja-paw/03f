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
            pageContext.setAttribute("sueldo", 25000);
        %>
        <%--
            forma alternativa:
            <c:set var="sueldo" value="25000" />
        --%>


        <h1>JSTL: i18n y formateo</h1>
        <section>
            <h2>fmt:formatNumber de números</h2>
            <ul>
                <li>Número: <fmt:formatNumber type="number" value="${sueldo}" /></li>
                <li>Tanto por ciento: <fmt:formatNumber type="percent" value="${sueldo}" /></li>

            </ul>
        </section>


        <section>
            <h2>fmt:formatNumber de monedas</h2>
            <ul>

                <li>Por defecto: <fmt:formatNumber type="CURRENCY" value="${sueldo}" /></li>

                <li><fmt:setLocale value="en_GB"/> Locale en_GB:
                    <fmt:formatNumber type="CURRENCY" value="${sueldo}" /></li>


                <li><fmt:setLocale value="fr_CH"/>Locale fr_CH: 
                    <fmt:formatNumber type="CURRENCY" value="${sueldo}" /></li>


                <li><fmt:setLocale value="fr_FR"/> Locale fr_FR: 
                    <fmt:formatNumber type="CURRENCY" value="${sueldo}" /></li>


                <li><fmt:setLocale value="it_IT"/> Locale it_IT: 
                    <fmt:formatNumber type="CURRENCY" value="${sueldo}" /></li>

            </ul>
        </section>

        <section>
            <h2>fmt:parseNumber</h2>
            <fmt:parseNumber var="num" value="25.000,00"/>${num}<br>
            <fmt:parseNumber var="num" value="25,000.00" parseLocale="en_US"/>${num}<br>
            <fmt:parseNumber var="num" value="25,000.00"/>${num}<br>

        </section>


    </body>
</html>
