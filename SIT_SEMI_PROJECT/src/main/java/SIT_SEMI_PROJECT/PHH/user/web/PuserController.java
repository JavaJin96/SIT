package SIT_SEMI_PROJECT.PHH.user.web;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
		List<PuserVO> list = puserService.selectUser();
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
	
	@RequestMapping(value = "phh/puserExcel.do")
	public void downExcel(HttpServletResponse response) throws IOException{
		XSSFWorkbook wb=null;
		Sheet sheet=null;
		Row row=null;
		Cell cell=null; 
		wb = new XSSFWorkbook();
		sheet = wb.createSheet("phh");		
		
	    // 엑셀 헤더 작성
	    Row headerRow = sheet.createRow(0);
	    headerRow.createCell(0).setCellValue("회원번호");
	    headerRow.createCell(1).setCellValue("아이디");
	    headerRow.createCell(2).setCellValue("닉네임");
	    headerRow.createCell(3).setCellValue("역할");
	    headerRow.createCell(4).setCellValue("가입일자");
		
	    List<PuserVO> list = puserService.selectUser();
	    
		// row(행) 생성
		int rowNum = 1;
		for (PuserVO user : list) {
			row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(user.getNo());
			row.createCell(1).setCellValue(user.getId());
			row.createCell(2).setCellValue(user.getName());
			row.createCell(3).setCellValue(user.getRole());
			row.createCell(4).setCellValue(user.getRegDate());
		}
		
		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=userInfo.xlsx");  //파일이름지정.
		//response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
		
		
	}	

}
