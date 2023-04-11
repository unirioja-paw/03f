<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAW</title>
    </head>
    <body>
        <%
            pageContext.setAttribute("importe", 3.5);
        %>

        <h1>JSTL: i18n y formateo</h1>
        <section>
            <h2>fmt:formatNumber con currencyCode</h2>
            <ul>
                <li>
                    EUR: <fmt:formatNumber currencyCode="EUR" value="${importe}" type="currency" />    
                </li>
                <li>
                    USD: <fmt:formatNumber currencyCode="USD" value="${importe}" type="currency"/>
                </li>
            </ul>

        </section>

    </body>
</html>
