package website.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import website.exception.AccountException;
import website.exception.BusinessException;

@Controller
public class ExceptionTestController {

    @RequestMapping("/exceptionTest.do")
    public ModelAndView encodingTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String exception = (String) request.getParameter("exception");
        if (exception.equals("account")) {
            throw new AccountException("帳戶錯誤");
        }
        else if (exception.equals("business")) {
            throw new BusinessException("商業邏輯錯誤");
        }
        return new ModelAndView("exceptionTest");
    }

}
