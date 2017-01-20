package website.aop;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Service;

//@Aspect
@Service
public class LogInterceptor {
    // 宣告並取得logger
    private Logger logger = Logger.getLogger(LogInterceptor.class);

    // 程式在進入website.model下的方法前皆會執行此段程式
    @Before("execution(* website.model.*.*(..))")
    public void before(JoinPoint point) {
        String className = MethodSignature.class.cast(point.getSignature()).getDeclaringType().getName();
        String methodName = MethodSignature.class.cast(point.getSignature()).getMethod().getName();
        logger.info("Enter " + className + " " + methodName + "()");
    }

    @Around("execution(* website..*(..))")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        Object result = null;
        try {
            result = point.proceed();
        }
        catch (Exception ex) {
            logger.debug(ex);
        }
        return result;
    }

}