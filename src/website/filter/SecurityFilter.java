package website.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SecurityFilter implements Filter {

    private FilterConfig filterConfig;

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String uri = httpRequest.getRequestURI();
        HttpSession session = httpRequest.getSession();
        String auth = (String) session.getAttribute("Authorise");
        ServletContext context = filterConfig.getServletContext();
        if ("/Website/".equals(uri) || ("/Website/login.do").equals(uri) || ("/Website/logout.do").equals(uri) || ("/Website/register.do").equals(uri)) {
            filterChain.doFilter(request, response);
        }
        else if (auth == null) {
            RequestDispatcher dispatcher = context.getRequestDispatcher("/WEB-INF/jsp/404.jsp");
            dispatcher.forward(request, response);
        }
        else {
            filterChain.doFilter(request, response);
        }

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }
}
