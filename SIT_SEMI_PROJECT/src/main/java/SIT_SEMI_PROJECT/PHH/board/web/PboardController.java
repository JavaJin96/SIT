package SIT_SEMI_PROJECT.PHH.board.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import SIT_SEMI_PROJECT.PHH.board.PboardVO;
import SIT_SEMI_PROJECT.PHH.board.PcommentVO;
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
	
	@RequestMapping(value="phh/psearchList.do")
	public ModelAndView searchBoard(@RequestParam String selectSearch, @RequestParam String search) {
		ModelAndView mav = new ModelAndView();
		List<?> list = pboardService.searchBoard(selectSearch, search);
		mav.addObject("list", list);
//		mav.setViewName("psearchList");
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
	public ModelAndView deleteBoard(@RequestParam int no, @RequestParam int gubun) {
		ModelAndView mav = new ModelAndView();
		pboardService.deleteBoard(no);
		if (gubun == 3) {
			mav.setView(new RedirectView("pboardList.do"));
		} else if (gubun ==1) {
			mav.setView(new RedirectView("pboardNoticeList.do"));
		}
		return mav;
	}
	
	@RequestMapping(value="phh/pboardContent.do")
	public ModelAndView viewBoard(@RequestParam int no) {
		ModelAndView mav = new ModelAndView();
		pboardService.countBoard(no);
		List<?> co = pboardService.viewComment(no);
		PboardVO vo = pboardService.viewBoard(no);
		mav.addObject("vo", vo);
		mav.addObject("co", co);
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
	public ModelAndView updateBoard(@RequestParam int no, @RequestParam String title, @RequestParam String contents, @RequestParam int gubun) {
		ModelAndView mav = new ModelAndView();
		PboardVO vo = new PboardVO(); 
		vo.setNo(no);
		vo.setTitle(title);
		vo.setContents(contents);
		pboardService.updateBoard(vo);
		if (gubun == 3) {
			mav.setView(new RedirectView("pboardList.do"));
		} else if (gubun == 1) {
			mav.setView(new RedirectView("pboardNoticeList.do"));
		}
		
		return mav;
	}
	
	@RequestMapping(value="phh/pboardNoticeList.do")
	public ModelAndView goNoticeBoard() {
		ModelAndView mav = new ModelAndView();
		List<?> list = pboardService.selectNoticeBoard();
		mav.addObject("list", list);
		mav.setViewName("pboardNoticeList");
		return mav;
	}
	
	@RequestMapping(value="phh/psearchNoticeList.do")
	public ModelAndView searchNoticeBoard(@RequestParam String selectSearch, @RequestParam String search) {
		ModelAndView mav = new ModelAndView();
		List<?> list = pboardService.searchNoticeBoard(selectSearch, search);
		mav.addObject("list", list);
		mav.setViewName("pboardNoticeList");
		return mav;
	}		
	
	@RequestMapping(value="phh/pboardNoticeWrite.do")
	public ModelAndView writeNoticeBoard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pboardNoticeWrite");
		return mav;
	}	
	
	@RequestMapping(value="phh/pboardNoticeInsert.do")
	public ModelAndView insertNoticeBoard(@RequestParam int userNo, @RequestParam String title, @RequestParam String contents, @RequestParam int count, @RequestParam int gubun) {
		ModelAndView mav = new ModelAndView();
		PboardVO vo = new PboardVO();
		vo.setUserNo(userNo);
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setCount(count);
		vo.setGubun(gubun);
		pboardService.insertNoticeBoard(vo);
		mav.setView(new RedirectView("pboardNoticeList.do"));
		return mav;
	}
	
	@RequestMapping(value = "phh/pcommentWrite.do")
	public ModelAndView insertComment(@RequestParam int userNo, @RequestParam int boardNo, @RequestParam String comment) {
		ModelAndView mav = new ModelAndView();
		PcommentVO co = new PcommentVO();
		co.setUserNo(userNo);
		co.setBoardNo(boardNo);
		co.setComment(comment);
		pboardService.insertComment(co);
		
//		PboardVO vo = pboardService.viewBoard(boardNo);
//		mav.addObject("vo", vo);
//		mav.setViewName("pboardContent");
		
		mav.setView(new RedirectView("pboardContent.do?no=" + boardNo));
		
		return mav;
	}
	
	@RequestMapping(value = "phh/pcommentDelete.do")
	public ModelAndView deleteComment(@RequestParam int replyNo, @RequestParam int boardNo) {
		ModelAndView mav = new ModelAndView();
		pboardService.deleteComment(replyNo);
		
		mav.setView(new RedirectView("pboardContent.do?no=" + boardNo));
		
		return mav;
	}
	
}
