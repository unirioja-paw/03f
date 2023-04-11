<%-- 

  Es el paso siguiente a saludo1.jsp
  Usa el locale que saludo1.jsp pone en la sesion del usuario
  
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
        <%--
          Fijarse que no se usa <fmt:setLocale 
          Por eso se usa el que está en la sesión, que se ha puesto en la página 
          anterior
        --%>
        <fmt:setBundle basename="mensajesP" var="mensajesConParam"/>
        <fmt:setBundle basename="mensajes"/>

        <h1><fmt:message key="despedida" bundle="${mensajesConParam}"><fmt:param value="${userName}"/></fmt:message></h1>

            <a href="saludo1.jsp"><fmt:message key="volver"/></a>
    </body>
</html>
