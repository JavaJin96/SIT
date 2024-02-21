package SIT_SEMI_PROJECT.RYH.board.web;

import java.util.List;




import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import SIT_SEMI_PROJECT.RYH.board.RboardVO;
import SIT_SEMI_PROJECT.RYH.board.service.RboardService;


@Controller
public class RboardController {
	
	@Resource(name = "rboardService")
	RboardService rboardService;

	@RequestMapping(value="ryh/rboardList.do")
	public ModelAndView goBoard() {
		ModelAndView mav = new ModelAndView();
		List<?> list = rboardService.selectBoard();
		mav.addObject("list", list);
		mav.setViewName("rboardList");
		return mav;
		
	}
	
	@RequestMapping(value="ryh/rboardWrite.do")
	public ModelAndView writeBoard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("rboardWrite");
		return mav;
	}
	
	@RequestMapping(value="ryh/rboardInsert.do")
	public ModelAndView insertBoard(@RequestParam String title, @RequestParam String contents, @RequestParam int count,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		RboardVO vo = new RboardVO();
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setCount(count);

		String writer = (String) request.getSession().getAttribute("userName");
	    vo.setWriter(writer);
	    
		rboardService.insertBoard(vo);
		mav.setView(new RedirectView("rboardList.do"));
		return mav;
	}
	
	
	@RequestMapping(value="ryh/rboardContent.do")
	public ModelAndView contentBoard(@RequestParam int num) {
		ModelAndView mav = new ModelAndView();
		rboardService.countBoard(num);
		RboardVO vo = rboardService.contentBoard(num);
		mav.addObject("vo", vo);
		mav.setViewName("rboardContent");
		return mav;
	}
	
	@RequestMapping(value="ryh/rboardUpdatepage.do")
	public ModelAndView updateBoardpage(@RequestParam int num) {
		ModelAndView mav = new ModelAndView();
		RboardVO vo = rboardService.contentBoard(num);
		mav.addObject("vo", vo);
		mav.setViewName("rboardUpdate");
		return mav;
	}
	
	@RequestMapping(value="ryh/updateBoard.do")
	public ModelAndView updateBoard(@RequestParam int num, @RequestParam String title, @RequestParam String contents) {
		ModelAndView mav = new ModelAndView();
		RboardVO vo = new RboardVO();
		vo.setNum(num);
		vo.setTitle(title);
		vo.setContents(contents);
		rboardService.updateBoard(vo);
		mav.setView(new RedirectView("rboardList.do"));
		return mav;
		
	}
	
	@RequestMapping(value="ryh/deleteBoard.do")
	public ModelAndView deleteBoard(@RequestParam int num) {
		ModelAndView mav = new ModelAndView();
		rboardService.deleteBoard(num);
		mav.setView(new RedirectView("rboardList.do"));
		return mav;
		
	}
	
	@RequestMapping(value="ryh/rsearchList.do")
	public ModelAndView searchBoard(@RequestParam String search) {
		ModelAndView mav = new ModelAndView();
		List<?> list = rboardService.searchBoard(search);
		mav.addObject("list", list); 
		mav.setViewName("rboardList");
		return mav;
	}
}

