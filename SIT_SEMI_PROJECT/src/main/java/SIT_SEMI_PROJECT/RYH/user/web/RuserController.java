package SIT_SEMI_PROJECT.RYH.user.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import SIT_SEMI_PROJECT.RYH.user.service.RuserService;

@Controller
public class RuserController {
	
	@Resource(name = "ruserService")
	RuserService ruserService;
	
	@RequestMapping(value="ryh/ruserLogin.do")
	public ModelAndView goLogin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ruserLogin");
		return mav;
	}
	
	@RequestMapping(value="ryh/ruserRegister.do")
	public ModelAndView goRegister() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ruserRegister");
		return mav;
	}

}
