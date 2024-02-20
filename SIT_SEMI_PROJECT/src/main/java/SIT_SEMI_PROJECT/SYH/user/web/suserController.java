package SIT_SEMI_PROJECT.SYH.user.web;

import java.util.List;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		
		List<SuserVO> list = suserService.selectUser();
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
	
	@RequestMapping(value = "syh/suserpoi.do")
	public void suserPoi(HttpServletResponse response) throws IOException {
		
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("syhPoi");
		XSSFRow row = sheet.createRow(0);
		XSSFCell cell;
		
		// 헤더(Header) 생성 (상단바)
		cell = row.createCell(0);
		cell.setCellValue("회원번호");
		
		cell = row.createCell(1);
		cell.setCellValue("ID");
		
		cell = row.createCell(2);
		cell.setCellValue("닉네임");
		
		cell = row.createCell(3);
		cell.setCellValue("권한");
		
		cell = row.createCell(4);
		cell.setCellValue("가입일자");
		
		List<SuserVO> list = suserService.selectUser();
		
		// 리스트의 Size만큼 row 생성
		SuserVO vo;
		for(int rowIdx = 0; rowIdx < list.size(); rowIdx++) {
			vo = list.get(rowIdx);
			
			row = sheet.createRow(rowIdx + 1);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getNum());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getId());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getName());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getAuth());
			
			cell = row.createCell(4);
			cell.setCellValue(vo.getRegdate());
		}
		
		// 다운로드 폴더에 응답됨 -> 현호님 코드 참고 (타입, 헤더, 파일명 지정 후 데이터 write)
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=userDataPoi.xlsx");  // 파일명
		// 데이터 쓰기
		workbook.write(response.getOutputStream());
	}
		
		/*
		// File로 쓰기
		File file = new File("C:\\Users\\userDataPoi.xlsx");
		FileOutputStream fos = null;  // 데이터 쓰기위한 클래스
		
		try {
			fos = new FileOutputStream(file);
			workbook.write(fos);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fos != null) fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	*/
	
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
