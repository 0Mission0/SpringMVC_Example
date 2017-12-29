package website.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class I18N_TestController {

    @RequestMapping("/i18n_example.do")
    public ModelAndView encodingTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("i18N_Example");
    }

}
