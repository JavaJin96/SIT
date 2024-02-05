package SIT_SEMI_PROJECT.PHH.user.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import SIT_SEMI_PROJECT.PHH.user.PuserVO;
import SIT_SEMI_PROJECT.PHH.user.service.PuserService;

@Controller
public class PuserController {
	
	@Resource(name = "puserService")
	PuserService puserService;
	
	@RequestMapping(value="phh/puserList.do")
	public ModelAndView goUser() {
		ModelAndView mav = new ModelAndView();
		List<?> list = puserService.selectUser();
		mav.addObject("list", list);
		mav.setViewName("puserList");
		return mav;
	}
	
	@RequestMapping(value="phh/puserDelete.do")
	public ModelAndView deleteUser(int no) {
		ModelAndView mav = new ModelAndView();
		puserService.deleteUser(no);
		
		mav.setView(new RedirectView("puserList.do"));
		
		return mav;
	}
	
	@RequestMapping(value="phh/puserGoLogin.do")
	public ModelAndView goLogin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("puserLogin");
		return mav;
	}
	
	@RequestMapping(value="phh/puserDoLogin.do")
	public ModelAndView doLogin(@RequestParam String id, @RequestParam String pass, HttpServletRequest request) {
		
		PuserVO vo = new PuserVO();
		vo.setId(id);
		vo.setPass(pass);
		
		vo = puserService.doLogin(vo);
		
		ModelAndView mav = new ModelAndView();
		
		if (vo != null) {
			mav.addObject("vo", vo);
			mav.setView(new RedirectView("pboardNoticeList.do"));
			HttpSession session = request.getSession();
			session.setAttribute("userId", vo.getId());
			session.setAttribute("userNo", vo.getNo());		
			session.setAttribute("userName", vo.getName());
			session.setAttribute("userRole", vo.getRole());
		} else {
			mav.addObject("loginFailed", true);
			mav.setViewName("puserLogin");
		}
		
		return mav;
	}
	
	@RequestMapping(value="phh/puserDoLogout.do")
	public ModelAndView doLogout(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		request.getSession().invalidate();
		mav.setView(new RedirectView("pboardNoticeList.do"));
		
		return mav;
	}		
	
	@RequestMapping(value="phh/puserSignup.do")
	public ModelAndView goSignup() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("puserSignup");
		
		return mav;
	}
	
	
	@RequestMapping(value="phh/puserInsert.do")
	public ModelAndView insertUser(@RequestParam String id, @RequestParam String name, @RequestParam String pass, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		PuserVO vo = new PuserVO();
		vo.setId(id);
		vo.setName(name);
		vo.setPass(pass);
		
		puserService.insertUser(vo);
				
		vo = puserService.doLogin(vo);		
		HttpSession session = request.getSession();
		
		session.setAttribute("userId", vo.getId());
		session.setAttribute("userNo", vo.getNo());		
		session.setAttribute("userName", vo.getName());
		session.setAttribute("userRole", vo.getRole());
		
		mav.setView(new RedirectView("pboardNoticeList.do"));
		
		return mav;
	}
	
	@RequestMapping(value="phh/puserDbCheck.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String dbCheck(@RequestParam String id) {
	    String dbId = puserService.dbCheck(id);
	    // Ajax 방식으로 돌려주기
	    return "{\"dbId\":\"" + dbId + "\"}";
	}	
	
	@RequestMapping(value="phh/puserNameCheck.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String nameCheck(@RequestParam String name) {
	    String dbName = puserService.nameCheck(name);
	    // Ajax 방식으로 돌려주기
	    return "{\"dbName\":\"" + dbName + "\"}";
	}		

}
