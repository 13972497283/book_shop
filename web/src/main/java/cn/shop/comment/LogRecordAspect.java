package cn.shop.comment;

import cn.shop.utils.BusinessException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * aop切面
 */
@Aspect
@Component
@Order(1)
public class LogRecordAspect {
    private  static  final Logger logger= LoggerFactory.getLogger(LogRecordAspect.class);

    @Pointcut("execution(* cn.shop.controller..*(..))")
    public void cutPoint(){

    }

    @Around(value = "cutPoint()")
    public Object doAround(ProceedingJoinPoint point)  throws Throwable{
        RequestAttributes attributes= RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra=(ServletRequestAttributes)attributes;
        HttpServletRequest request = sra.getRequest();
        HttpServletResponse response = sra.getResponse();
        String uri = request.getRequestURI();
        String method = request.getMethod();
        String url = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        logger.info("url:{},params:{}",url,queryString==null?"":queryString);
        ModelAndView result=new ModelAndView();
        try {
            Object proceed = point.proceed();
            return  proceed;
        }catch (BusinessException e){
            result.addObject("errorMessage",e.getErrorMessage());
            logger.info("error,message: {}",e.getErrorMessage());
        }catch (Exception e){
            result.addObject("errorMessage","系统错误");
            logger.info("error,errorMessage:{}",e.getMessage());
        }
        return  result;
    }
}
