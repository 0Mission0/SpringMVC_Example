package website.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import website.exception.AccountException;
import website.exception.BusinessException;

public class ExceptionHandleFilter implements Filter {

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        try {
            filterChain.doFilter(request, response);
        }
        catch (Exception ex) {
            Throwable rootCause = ex;
            while (rootCause.getCause() != null) {
                rootCause = rootCause.getCause();
            }

            String message = rootCause.getMessage();
            if (message == null) {
                message = "異常： " + rootCause.getClass().getName();
            }

            if (rootCause instanceof AccountException) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/accountException.jsp");
                dispatcher.forward(request, response);
            }
            else if (rootCause instanceof BusinessException) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/businessException.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Do nothing
    }
}
