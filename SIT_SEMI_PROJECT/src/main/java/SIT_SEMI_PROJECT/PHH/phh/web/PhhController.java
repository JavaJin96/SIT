package SIT_SEMI_PROJECT.PHH.phh.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import SIT_SEMI_PROJECT.PHH.phh.service.PhhService;

@Controller
public class PhhController {
	
	@Resource(name = "phhService")
	PhhService phhService;
	
	@RequestMapping(value = "phh/main.do")
	public ModelAndView goMain() {
		ModelAndView mav = new ModelAndView();
		
		List<?> test = phhService.selectTest();
		
		mav.addObject("test", test);
		
		mav.setViewName("phhPage");
		return mav;
	}
	
}
