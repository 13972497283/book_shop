package cn.shop.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyHandlerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        if(request.getSession().getAttribute("username")==null) {
//            response.sendRedirect(request.getContextPath()+"/pages/login.jsp");
//            return false;
//        }
        return  true;
    }
}
