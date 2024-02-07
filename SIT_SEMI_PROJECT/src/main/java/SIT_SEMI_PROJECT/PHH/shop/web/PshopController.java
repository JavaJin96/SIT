package SIT_SEMI_PROJECT.PHH.shop.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import SIT_SEMI_PROJECT.PHH.shop.service.PshopService;

@Controller
public class PshopController {

	@Resource(name = "pshopService")
	PshopService pshopService;
	
	@RequestMapping(value="phh/pshopList.do")
	public ModelAndView goShop() {
		ModelAndView mav = new ModelAndView();
		List<?> list = pshopService.selectShop();
		mav.addObject("list", list);
		mav.setViewName("pshopList");
		return mav;
	}
}
