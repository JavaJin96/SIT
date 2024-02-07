package SIT_SEMI_PROJECT.PSJ.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import SIT_SEMI_PROJECT.PSJ.service.PsjService;

@Controller
public class PsjController {

	@Resource(name = "psjService")
	PsjService psjService;
	
	@RequestMapping("psj/main.do")
	public ModelAndView psjMain() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("mainPage");
		return mav;
		
	}
	
	
}
