package SIT_SEMI_PROJECT.SYH.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import SIT_SEMI_PROJECT.SYH.service.SyhService;

@Controller
public class syhController {
	
	@Resource(name = "SyhService")
	SyhService syhService;
	
	@RequestMapping(value = "syh/main.do")
	public ModelAndView fMain() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("syhMain");
		return mav;
	}
	
}
