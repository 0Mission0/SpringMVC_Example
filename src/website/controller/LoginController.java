package website.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import website.model.AccountModel;

@Controller
public class LoginController {

    private AccountModel accountModel;

    @Resource(name = "accountModel")
    public void setAccountModel(AccountModel accountModel) {
        this.accountModel = accountModel;
    }

    // 處理登入動作
    @RequestMapping("/login.do")
    public ModelAndView handleLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("userName");
        String password = request.getParameter("password");

        // 檢核使用者登入帳密
        Map<String, Object> resultMap = accountModel.checkAccount(name, password);
        if (resultMap == null || resultMap.size() == 0) {
            Map<String, Object> errMsg = new HashMap<String, Object>();
            errMsg.put("errMsg", "Incorrect username or password");
            return new ModelAndView("login", errMsg);
        }
        else {
            HttpSession session = request.getSession();
            session.setAttribute("name", name);
            String auth = (String) resultMap.get("Authorise");
            session.setAttribute("Authorise", auth);
            return new ModelAndView(new RedirectView("index.do"));
        }
    }

    @RequestMapping("/index.do")
    public ModelAndView doIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("index");
    }

    @RequestMapping("/register.do")
    public void doRegister(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String newAccount = request.getParameter("newAccount");
        String newPassword = request.getParameter("newPassword");
        String newName = request.getParameter("newName");
        String newBirthday = request.getParameter("newBirthday");
        String newPhone = request.getParameter("newPhone");

        int flag = accountModel.createAccount(newAccount, newPassword, newName, newBirthday, newPhone);
        response.getWriter().print(flag);
    }

    @RequestMapping("/industryList.do")
    public ModelAndView doIndustry(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("industryList");
    }

    @RequestMapping("/logout.do")
    public ModelAndView handleLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.getSession().removeAttribute("Authorise");
        return new ModelAndView("login");

    }

}
