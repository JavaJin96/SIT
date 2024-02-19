package SIT_SEMI_PROJECT.SYH.user.web;

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

import SIT_SEMI_PROJECT.SYH.user.SuserVO;
import SIT_SEMI_PROJECT.SYH.user.service.suserService;

@Controller
public class suserController {

	@Resource(name = "suserService")
	suserService suserService;
	
	@RequestMapping(value = "syh/suserList.do")
	public ModelAndView suserList() {  // 유저 리스트 (유저 관리)
		ModelAndView mav = new ModelAndView();
		
		List<?> list = suserService.selectUser();
		mav.addObject("list", list);
		mav.setViewName("suserList");
		
		return mav;
	}
	
	
	@RequestMapping(value = "syh/slogin.do")  
	public ModelAndView slogin() {  // 로그인 페이지
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("slogin");
		return mav;
	}
	
	@RequestMapping(value = "syh/sSignup.do")
	public ModelAndView sSignup() {  // 회원가입 페이지
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("sSignup");
		return mav;
	}
	
	@RequestMapping(value = "syh/suserInsert.do")
	public ModelAndView insertUser(@RequestParam String id, @RequestParam String pass, @RequestParam String name) {
		ModelAndView mav = new ModelAndView();
		
		SuserVO vo = new SuserVO();
		vo.setId(id);
		vo.setPass(pass);
		vo.setName(name);
		
		suserService.insertUser(vo);
		mav.setView(new RedirectView("sboardMain.do"));
		
		return mav;
	}
	
	
	@RequestMapping(value = "syh/suserDelete.do")
	public ModelAndView suserDelete(int num) {  // 회원 삭제
		ModelAndView mav = new ModelAndView();
		suserService.deleteUser(num);

		mav.setView(new RedirectView("suserList.do"));

		return mav;
	}
	
	@RequestMapping(value = "syh/sdoLogin.do")
	public ModelAndView sdoLogin(@RequestParam String id, @RequestParam String pass, HttpServletRequest request) {  // 로그인 기능
		SuserVO vo = new SuserVO();
		vo.setId(id);
		vo.setPass(pass);
		vo = suserService.doLogin(vo);
		
		ModelAndView mav = new ModelAndView();
		
		if (vo != null) {
			mav.addObject("vo", vo);
			mav.setView(new RedirectView("sboardMain.do"));
			
			HttpSession session = request.getSession();
			session.setAttribute("userId", vo.getId());
			session.setAttribute("userNum", vo.getNum());
			session.setAttribute("userName", vo.getName());
			session.setAttribute("userAuth", vo.getAuth());
		} else {
			mav.addObject("loginFailed", true);
			mav.setViewName("slogin");
		}

		return mav;
	}
	
	@RequestMapping(value="syh/sdoLogout.do")
	public ModelAndView doLogout(HttpServletRequest request) {  // 로그아웃
		ModelAndView mav = new ModelAndView();
		
		request.getSession().invalidate();
		mav.setView(new RedirectView("sboardMain.do"));

		return mav;
	}
	
	@RequestMapping(value = "syh/suserDbCheck.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String dbCheck(String id) {  // 아이디 중복체크
		
	    String dbId = suserService.dbCheck(id);
	    return "{\"dbId\":\"" + dbId + "\"}";
	}
	
	@RequestMapping(value = "syh/suserNameCheck.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String NameCheck(String name) {  // 닉네임 중복체크
		
	    String dbName = suserService.nameCheck(name);
	    return "{\"dbName\":\"" + dbName + "\"}";
	}
}
