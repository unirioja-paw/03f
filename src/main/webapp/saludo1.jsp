<%-- Coge el locale de un param elegido con un selector --%>

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

        <h1>Saludando en varios idiomas</h1>
        <h2>Esta parte de la página no esta internacionalizada. Incluye un formulario 
            con un selector que hace una petición a esta misma página pero añadiendo 
            un parámetro llamado "loc" (el nombre del parámetro podría ser cualquiera)</h2>
        <form action="saludo1.jsp"> <!-- Notar que la petición se dirig a esta misma página -->
            <select name="loc">       <!-- param para el locale -->
                <option value="es_ES">Español</option>
                <option value="en_GB">Inglés</option>
                <option value="fr_FR">Francés</option>
            </select>
            <input type="submit" value="Saluda" />
        </form>

        <!--Crea una variable llamada userName, que se usará luego para completar un mensaje-->
        <c:set value="Fran" var="userName" scope="session"></c:set>

        <%--
          Aquí se comprueba si en la petición se recibe un parámetro llamado "loc" que
          especifica el locale.
          Si no se recibiera, el locale no se cambia (no se ejecuta  <fmt:setLocale), 
          por lo que estamos en el mismo caso que el del fichero saludoBrw.jsp, es 
          decir, se coge el locale de la cabecera Accept-language
        --%>
        <%-- 
          Otra cosa importante es que, si se ejecuta <fmt:setLocale, el locale a 
          usar se deja en la sesión, por lo que se seguirá usando como locale por
          defecto durante el resto de peticiones
        --%>
        <c:if test="${not empty param.loc}" >
            <fmt:setLocale value="${param.loc}" scope="session"/>
        </c:if>

        <%--
          Aquí vemos que se especifican dos ficheros de bundle. Uno, el "mensajes",
          será el bundle por defecto. El otro, "mensajesP", está asociado a una
          variable llamada "mensajesConParam" que puede usarse luego en las 
          etiquetas <fmt:message
        --%>
        <fmt:setBundle basename="mensajesP" var="mensajesConParam"/>
        <fmt:setBundle basename="mensajes"/>
        <%-- 
          Si pusiesemos <fmt:setBundle basename="mensajesP" scope="sesion"/> se fija el bundle para la sesion
          por lo que en saludo2.jsp no habría que fijar un bundle
        --%>

        <h2>Esta parte de la página SI está internacionalizada</h2>

        <%--
          Aquí la etiqueta <fmt:message especifica que usa el bundle asociado a la 
          variable "mensajesConParam", es decir, el de los ficheros "mensajesP" 
        --%>
        <%-- La clave usada tiene parámetros --%>
        <p>
            <fmt:message key="saludo" bundle="${mensajesConParam}">
                <fmt:param value="${userName}"/>
            </fmt:message>
        </p>

        <%--
          Aquí las etiquetas <fmt:message no especifican ningún bundle, por lo que 
          usan el "mensajes"
        --%>
        <p>
            <a href="saludo2.jsp"><fmt:message key="enlace"/></a>
            Este enlace pasa a otra página que está internacionalizada y que usará
            el mismo locale que el elegido en esta página, porque ese locale se ha 
            puesto en la sesión
        </p>

        <p>Mismo formulario que antes pero internacionalizado</p>     
        <form action="saludo1.jsp"> <!-- Notar que la petición se dirig a esta misma página -->
            <select name="loc">       <!-- param para el locale -->
                <option value="es_ES"><fmt:message key="espaniol"/></option>
                <option value="en_GB"><fmt:message key="ingles"/></option>
                <option value="fr_FR"><fmt:message key="frances"/></option>
            </select>
            <input type="submit" value="<fmt:message key="saludaBt"/>" />
        </form>
    </body>
</html>
