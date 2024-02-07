package SIT_SEMI_PROJECT.RYH.ryh.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import SIT_SEMI_PROJECT.RYH.ryh.service.RYHService;

@Controller
public class RyhController {
	
	@Resource(name = "ryhService")
	RYHService ryhService;
	
	@RequestMapping("ryh/main.do")
	public ModelAndView ryhMain() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("ryhMainpage");
		return mav;
		
	}
}
