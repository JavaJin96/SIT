package SIT_SEMI_PROJECT.PHH.board.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import SIT_SEMI_PROJECT.PHH.board.PboardVO;
import SIT_SEMI_PROJECT.PHH.board.service.PboardService;

@Controller
public class PboardController {
	
	@Resource(name = "pboardService")
	PboardService pboardService;
	
	@RequestMapping(value="phh/pboardList.do")
	public ModelAndView goBoard() {
		ModelAndView mav = new ModelAndView();
		List<?> list = pboardService.selectBoard();
		mav.addObject("list", list);
		mav.setViewName("pboardList");
		return mav;
	}
	
	@RequestMapping(value="phh/pboardWrite.do")
	public ModelAndView writeBoard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pboardWrite");
		return mav;
	}
	
	@RequestMapping(value="phh/pboardInsert.do")
	public ModelAndView insertBoard(@RequestParam int userNo, @RequestParam String title, @RequestParam String contents, @RequestParam int count) {
		ModelAndView mav = new ModelAndView();
		PboardVO vo = new PboardVO();
		vo.setUserNo(userNo);
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setCount(count);
		pboardService.insertBoard(vo);
		mav.setView(new RedirectView("pboardList.do"));
		return mav;
	}
	
	@RequestMapping(value="phh/pboardDelete.do")
	public ModelAndView deleteBoard(@RequestParam int no) {
		ModelAndView mav = new ModelAndView();
		pboardService.deleteBoard(no);
		mav.setView(new RedirectView("pboardList.do"));
		return mav;
	}
	
	@RequestMapping(value="phh/pboardContent.do")
	public ModelAndView viewBoard(@RequestParam int no) {
		ModelAndView mav = new ModelAndView();
		pboardService.countBoard(no);
		PboardVO vo = pboardService.viewBoard(no);
		mav.addObject("vo", vo);
		mav.setViewName("pboardContent");
		return mav;
	}
	@RequestMapping(value="phh/pboardUpdatePage.do")
	public ModelAndView updatepageBoard(@RequestParam int no) {
		ModelAndView mav = new ModelAndView();
		PboardVO vo = pboardService.viewBoard(no);
		mav.addObject("vo", vo);
		mav.setViewName("pboardUpdatePage");
		return mav;
	}
	@RequestMapping(value="phh/pboardUpdate.do")
	public ModelAndView updateBoard(@RequestParam int no, @RequestParam String title, @RequestParam String contents) {
		ModelAndView mav = new ModelAndView();
		PboardVO vo = new PboardVO(); 
		vo.setNo(no);
		vo.setTitle(title);
		vo.setContents(contents);
		pboardService.updateBoard(vo);
		mav.setView(new RedirectView("pboardList.do"));
		return mav;
	}
	

	
	
	
}
