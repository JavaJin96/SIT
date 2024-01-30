package SIT_SEMI_PROJECT.PHH.user.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value="phh/puserSignup.do")
	public ModelAndView goSignup() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("puserSignup");
		return mav;
	}	
	
	
	@RequestMapping(value="phh/puserInsert.do")
	public ModelAndView insertUser(@RequestParam String id, @RequestParam String name, @RequestParam String pass) {
		ModelAndView mav = new ModelAndView();
		
		PuserVO vo = new PuserVO();
		vo.setId(id);
		vo.setName(name);
		vo.setPass(pass);
		
		puserService.insertUser(vo);
		
		mav.setView(new RedirectView("puserList.do"));
		
		return mav;
	}	

}
