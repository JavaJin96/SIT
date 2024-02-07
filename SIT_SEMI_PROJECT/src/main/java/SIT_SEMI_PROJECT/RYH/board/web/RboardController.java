package SIT_SEMI_PROJECT.RYH.board.web;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import SIT_SEMI_PROJECT.RYH.board.service.RboardService;

@Controller
public class RboardController {
	
	@Resource(name = "rboardService")
	RboardService rboardService;

	@RequestMapping(value="/rboardList.do")
	public ModelAndView goBoard() {
		ModelAndView mav = new ModelAndView();
		List<?> list = rboardService.selectBoard();
		mav.addObject("list", list);
		mav.setViewName("rboardList");
		return mav;
		
	}
}

