package SIT_SEMI_PROJECT.main.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import SIT_SEMI_PROJECT.main.service.MainService;

@Controller
public class MainController {
	
	@Resource(name = "mainService")
	MainService mainService;
	
	
	@RequestMapping("main/main.do")
	public ModelAndView goMain() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("mainPage");
		return mav;
	}

	
	
}
