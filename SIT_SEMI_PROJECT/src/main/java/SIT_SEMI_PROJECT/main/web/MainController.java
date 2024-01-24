package SIT_SEMI_PROJECT.main.web;

import javax.annotation.Resource;
import javax.enterprise.inject.Model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import SIT_SEMI_PROJECT.main.service.MainService;

@Controller
public class MainController {
	
	@Resource(name = "mainService")
	MainService mainService;
	
	
	@RequestMapping(value = "main/main.do")
	public ModelAndView goMain() {
		ModelAndView mav = new ModelAndView();
		
		String queryResult = "seoifjeso";
		mav.addObject("queryResult", queryResult);
		mav.setViewName("mainPage");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "main/main.do2")
	public String goMain2() {
		ModelAndView mav = new ModelAndView();
		return "success";
	}

	
	
}
