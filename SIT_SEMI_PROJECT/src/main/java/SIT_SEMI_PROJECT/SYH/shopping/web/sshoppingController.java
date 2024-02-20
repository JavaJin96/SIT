package SIT_SEMI_PROJECT.SYH.shopping.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import SIT_SEMI_PROJECT.SYH.shopping.service.sshoppingService;
import SIT_SEMI_PROJECT.SYH.shopping.service.impl.sshoppingDAO;

@Controller
public class sshoppingController {

	@Resource(name = "sshoppingService")
	sshoppingService sshoppingService;
	
	@RequestMapping(value="syh/sshoppingMain.do")
	public ModelAndView sshoppingMain() {
		ModelAndView mav = new ModelAndView();
		
		List<sshoppingDAO> list = sshoppingService.shopList();
		
		mav.addObject("list", list);
		mav.setViewName("sshoppingMain");
		return mav;
		
	}
}
