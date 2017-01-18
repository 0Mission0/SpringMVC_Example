package website.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import website.aop.LogInterceptor;

public class ImageRedirectFilter implements Filter {

    // 宣告並取得logger
    private Logger logger = Logger.getLogger(LogInterceptor.class);

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        String serverName = request.getServerName();
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String referer = httpRequest.getHeader("referer");
        // 如果直連圖片或前一頁不是本站，轉跳 404。
        if (referer == null || referer.contains(serverName) == false) {
            logger.info("Forbiden Access: serverName = " + serverName + ", referer = " + referer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/image/404.jpg");
            dispatcher.forward(request, response);
        }
        else {
            filterChain.doFilter(request, response);
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Do nothing
    }
}
