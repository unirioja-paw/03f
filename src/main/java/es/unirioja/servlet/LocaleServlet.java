package es.unirioja.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LocaleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        Locale locale = Locale.getDefault();

        out.println("Default locale: " + locale);

        printRequestLocaleInfo(request);

    }

    private void printRequestLocaleInfo(HttpServletRequest request) {
        System.out.println("= request.getLocale()");
        printLocaleInfo(request.getLocale());

        System.out.println("= request.getLocales()");
        Enumeration<Locale> locales = request.getLocales();
        if (locales == null) {
            System.out.println("getLocales null");
        } else {
            List<Locale> localeCollection = Collections.list(locales);
            System.out.println(localeCollection.size() + " locales:");
            for (Locale locale : localeCollection) {
                printLocaleInfo(locale);
            }

        }
    }

    private void printLocaleInfo(Locale locale) {
        System.out.println("Locale: " + locale.toString());
    }

}
