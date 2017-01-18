package website.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EncodingTestController {

    @RequestMapping("/encodingTest.do")
    public ModelAndView encodingTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // this has been processed by Filter and must be first line
        // request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String content = (String) request.getParameter("content");
        session.setAttribute("content", content);
        return new ModelAndView("encodingTest");
    }

}
