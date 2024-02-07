package SIT_SEMI_PROJECT.SYH.syh.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SyhController {
	
	@RequestMapping(value = "syh/main.do")
	public ModelAndView Main() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("syhMain");
		return mav;
	}
}
