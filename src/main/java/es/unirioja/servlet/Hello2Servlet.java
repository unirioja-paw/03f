package es.unirioja.servlet;

import java.io.IOException;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Ejemplo simple de una unica vista para todos los idiomas: aproximacion
 * intuitiva de lo que representa un fichero de mensajes (bundle). En este caso
 * en vez de un fichero se usa un Map<String, String>
 *
 * No seria una buena aproximacion en la practica: para cambiar los textos
 * localizados hay que meterse en el propio codigo
 */
public class Hello2Servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // determinar el lenguaje a usar
        String languageCode = findCurrentLanguageCode();

        // mensajes (dependen del idioma)
        request.setAttribute("messages",
                buildBundleMessages(languageCode)
        );
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages/greeting.jsp");
        rd.forward(request, response);
    }

    private String findCurrentLanguageCode() {
        return "en";
    }

    private Map<String, String> buildBundleMessages(String languageCode) {
        String[][] messages = null;
        switch (languageCode) {
            case "es":
                messages = new String[][]{
                    {"saludo", "Hola"},
                    {"despedida", "Hasta luego"},
                    {"producto-detalles", "Detalles del producto"},
                    {"producto-precio", "Precio"},};
                break;
            case "en":
                messages = new String[][]{
                    {"saludo", "Hello"},
                    {"despedida", "See you later"},
                    {"producto-detalles", "Product detail"},
                    {"producto-precio", "Price"},};
                break;
        }

        if (messages == null) {
            return null;
        }

        Map<String, String> result = Stream.of(messages)
                .collect(Collectors.toMap(data -> data[0], data -> data[1]));

        return result;
    }

}
