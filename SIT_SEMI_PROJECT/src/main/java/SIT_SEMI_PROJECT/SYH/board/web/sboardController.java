package SIT_SEMI_PROJECT.SYH.board.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import SIT_SEMI_PROJECT.SYH.board.SboardVO;
import SIT_SEMI_PROJECT.SYH.board.service.sboardService;

@Controller
public class sboardController {

	@Resource(name = "sboardService")
	sboardService sboardService;
	
	
	@RequestMapping(value = "syh/sboardMain.do")
	public ModelAndView sboardMain() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("sboardMain");
		return mav;		
	}
	
	@RequestMapping(value = "syh/sboardNotice.do")
	public ModelAndView sboardNotice() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("sboardNotice");
		return mav;		
	}
	
	@RequestMapping(value = "syh/sboardFree.do")
	public ModelAndView sboardFree() {
		ModelAndView mav = new ModelAndView();
		
		List<?> list = sboardService.selectBoard();
		mav.addObject("list", list);
		mav.setViewName("sboardFree");
		return mav;		
	}
	
	@RequestMapping(value = "syh/sboardWrite.do")
	public ModelAndView sboardWrite() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("sboardWrite");
		return mav;		
	}
	
	@RequestMapping(value = "syh/sboardInsert.do")
	public ModelAndView insertBoard(int userNum, String title, String content, int count) {
		ModelAndView mav = new ModelAndView();
		
		SboardVO vo = new SboardVO();
		vo.setUserNum(userNum);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setCount(count);
		
		sboardService.insertBoard(vo);
		mav.setView(new RedirectView("sboardFree.do"));
		
		return mav;
	}
	
}
