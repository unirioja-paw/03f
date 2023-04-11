package es.unirioja.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Ejemplo simple de N versiones de vista, una por cada idioma soportado
 */
public class Hello1Servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // determinar el lenguaje a usar
        String languageCode = findCurrentLanguageCode();

        // elegir la version de la pagina que hara de vista
        String viewId = String.format("/WEB-INF/pages/greeting_%s.jsp", languageCode.toLowerCase());

        RequestDispatcher rd = request.getRequestDispatcher(viewId);
        rd.forward(request, response);
    }

    private String findCurrentLanguageCode() {
        return "en";
    }

}
