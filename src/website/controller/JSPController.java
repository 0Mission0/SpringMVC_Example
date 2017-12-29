package website.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import website.model.impl.Person;

@Controller
public class JSPController {

    @RequestMapping("/jstl.do")
    public ModelAndView showJSTLExample(HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (request.getParameter("list") != null) {
            ArrayList<Person> people = new ArrayList<Person>();
            Person person1 = new Person("1", "User1", "19", "Male", "台北市板橋區四川路一段一號");
            Person person2 = new Person("2", "User2", "20", "Female", "台北市板橋區四川路一段三三四號");
            people.add(person1);
            people.add(person2);
            HttpSession session = request.getSession();
            session.setAttribute("people", people);
        }
        return new ModelAndView("jstl");
    }

    @RequestMapping("/fmt.do")
    public ModelAndView showFMTExample(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("fmt");
    }

    @RequestMapping("/setLocale.do")
    public ModelAndView showSetLocaleExample(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("setLocale");
    }

    @RequestMapping("/setTimezone.do")
    public ModelAndView showSetTimeZoneExample(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("setTimeZone");
    }

}
