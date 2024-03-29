package SIT_SEMI_PROJECT.SYH.board.web;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import SIT_SEMI_PROJECT.SYH.board.SboardVO;
import SIT_SEMI_PROJECT.SYH.board.ScommentsVO;
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
	
	/*
	@RequestMapping(value = "syh/sboardFree.do")
	public ModelAndView sboardFree() {
		ModelAndView mav = new ModelAndView();
		
		List<?> list = sboardService.selectBoard();
		mav.addObject("list", list);
		mav.setViewName("sboardFree");
		return mav;		
	}
	*/
	
	@RequestMapping(value = "syh/sboardFree.do")
	public ModelAndView sboardFree(
	        @RequestParam(name = "page", defaultValue = "1") int currentPage) {
	    ModelAndView mav = new ModelAndView();

	    int itemsPerPage = 10; // 페이지당 10개
	    int start = (currentPage - 1) * itemsPerPage;
	    int end = itemsPerPage;
	    
	    List<SboardVO> list = sboardService.getBoardList(start, end);
	    
	    int totalItems = sboardService.getTotalBoardCount();
	    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

	    mav.addObject("list", list);
	    mav.addObject("currentPage", currentPage);
	    mav.addObject("totalPages", totalPages);

	    mav.setViewName("sboardFree");
	    return mav;
	}

	@RequestMapping(value = "syh/sboardContent.do")
	public ModelAndView sboardContent(int num, 
			@RequestParam(name = "cpage", defaultValue = "1") int ccurrentPage) {
		ModelAndView mav = new ModelAndView();
		
		sboardService.countBoard(num);
		SboardVO vo = sboardService.contentBoard(num);
		
		// 페이징 변수
		int citemsPerPage = 10;
		int cstart = (ccurrentPage - 1) * citemsPerPage;
		int cend = citemsPerPage;
		
		List<?> list = sboardService.getCommentsList(num, cstart, cend);
		
		int ctotalItems = sboardService.getTotalCommentsCount(num);
		int ctotalPages = (int) Math.ceil((double) ctotalItems / citemsPerPage);
		// List<?> co = sboardService.selectComments(num);
		
		mav.addObject("vo", vo);
		// mav.addObject("co", co);
		
		mav.addObject("list", list);
		mav.addObject("ccurrentPage", ccurrentPage);
		mav.addObject("ctotalPages", ctotalPages);
		
		mav.setViewName("sboardContent");
		return mav;
	}
	
	/*
	@RequestMapping(value = "syh/sboardContent.do")
	public ModelAndView sboardContent(int num) {  // 글 상세보기
		ModelAndView mav = new ModelAndView();
		
		sboardService.countBoard(num);
		SboardVO vo = sboardService.contentBoard(num);
		List<?> co = sboardService.selectComments(num);
		
		mav.addObject("vo", vo);
		mav.addObject("co", co);
		mav.setViewName("sboardContent");
		
		return mav;		
	}
	*/
	
	@RequestMapping(value = "syh/sboardWrite.do")
	public ModelAndView sboardWrite() {  // 글 등록 페이지
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("sboardWrite");
		
		return mav;		
	}
	
	@RequestMapping(value = "syh/sboardModifyCommentsPage.do")
	public ModelAndView sboardModifyCommentsPage(int num) {
		ModelAndView mav = new ModelAndView();
		
		SboardVO vo = sboardService.contentBoard(num);
		List<?> co = sboardService.selectComments(num);
		
		mav.addObject("vo", vo);
		mav.addObject("co", co);
		mav.setViewName("sboardModifyCommentsPage");
		
		return mav;
	}
	
	
	@RequestMapping(value = "syh/sboardInsert.do")
	public ModelAndView sboardInsert(int userNum, String title, String content, int count) {  // 등록 기능
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
	
	@RequestMapping(value = "syh/sboardInsertComments.do")
	public ModelAndView sboardInsertComments(int userNum, int boardNum, String comments) {
		ModelAndView mav = new ModelAndView();
		
		ScommentsVO co = new ScommentsVO();
		co.setUserNum(userNum);
		co.setBoardNum(boardNum);
		co.setComments(comments);
		
		sboardService.insertComments(co);
		mav.setView(new RedirectView("sboardContent.do?num=" + boardNum));
		
		return mav;
	}
	
	@RequestMapping(value = "syh/sboardModifyPage.do")
	public ModelAndView sboardModifyPage(int num) {
		ModelAndView mav = new ModelAndView();
		
		SboardVO vo = sboardService.contentBoard(num);
		mav.addObject("vo", vo);
		mav.setViewName("sboardModifyPage");
		
		return mav;
	}
	
	@RequestMapping(value = "syh/sboardModify.do")
	public ModelAndView sboardModify(int num, String title, String content) {
		ModelAndView mav = new ModelAndView();
		SboardVO vo = new SboardVO();
		
		vo.setNum(num);
		vo.setTitle(title);
		vo.setContent(content);
		
		sboardService.modifyBoard(vo);
		mav.setView(new RedirectView("sboardFree.do"));
		
		return mav;
	}
	
	@RequestMapping(value = "syh/sboardDelete.do")
	public ModelAndView sboardDelete(int num) {
		ModelAndView mav = new ModelAndView();
		
		sboardService.deleteBoard(num);
		mav.setView(new RedirectView("sboardFree.do"));
		
		return mav;
	}
	
	@RequestMapping(value = "syh/sboardSearch.do")
	public ModelAndView sboardSearch(String selectSearch, String search) {  // 검색
		ModelAndView mav = new ModelAndView();
		
		List<?> list = sboardService.searchBoard(selectSearch, search);
		
		mav.addObject("list", list);
		
		mav.setViewName("sboardFree");
		return mav;
	}
	
	@RequestMapping(value = "syh/sboardDeleteComments.do")
	public ModelAndView sboardDeleteComments(int commentsNum, int boardNum) {
		ModelAndView mav = new ModelAndView();
		
		sboardService.deleteComments(commentsNum);
		mav.setView(new RedirectView("sboardContent.do?num=" + boardNum));
		return mav;
	}
	

	@PostMapping(value = "syh/sboardModifyComments.do")
	public ModelAndView sboardModifyComments(int boardNum, int commentsNum, String comments) {
		ModelAndView mav = new ModelAndView();
		
		ScommentsVO co = new ScommentsVO();
		co.setBoardNum(boardNum);
		co.setCommentsNum(commentsNum);
		co.setComments(comments);
		
		sboardService.modifyComments(co);
		mav.setView(new RedirectView("sboardContent.do?num=" + boardNum));
		
		return mav;
	}
	
	@RequestMapping(value = "syh/sboardNotice.do")
	public ModelAndView sboardNotice() {
		ModelAndView mav = new ModelAndView();
		
		List<?> list = sboardService.selectNotice();
		
		mav.addObject("list", list);
		mav.setViewName("sboardNotice");
		return mav;		
	}
	
	@RequestMapping(value = "syh/snoticeWrite.do")
	public ModelAndView snoticeWrite() {  // 공지 등록 페이지
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("snoticeWrite");
		return mav;		
	}
	
	@RequestMapping(value = "syh/snoticeWriteInsert.do")
	public ModelAndView snoticeWriteInsert(int userNum, String title, String content, int count, int type) {  // 등록 기능
		ModelAndView mav = new ModelAndView();
		
		SboardVO vo = new SboardVO();
		vo.setUserNum(userNum);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setCount(count);
		vo.setType(type);
		sboardService.insertNotice(vo);
		
		mav.setView(new RedirectView("sboardNotice.do"));
		return mav;
	}
	
	@RequestMapping(value = "syh/snoticeContent.do")
	public ModelAndView snoticeContent(int num) {  // 공지글 상세보기
		ModelAndView mav = new ModelAndView();
		
		sboardService.countBoard(num);
		SboardVO vo = sboardService.contentNotice(num);
		
		mav.addObject("vo", vo);
		
		mav.setViewName("snoticeContent");
		return mav;		
	}
	
	@RequestMapping(value = "syh/sboardpoi.do")
	public void sboardpoi(HttpServletResponse response) throws IOException {
		
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("syhPoi");
		XSSFRow row = sheet.createRow(0);
		XSSFCell cell;
		
		// 헤더(Header) 생성 (상단바)
		cell = row.createCell(0);
		cell.setCellValue("글 번호");
		
		cell = row.createCell(1);
		cell.setCellValue("제목");
		
		cell = row.createCell(2);
		cell.setCellValue("내용");
		
		cell = row.createCell(3);
		cell.setCellValue("작성자");
		
		cell = row.createCell(4);
		cell.setCellValue("작성일자");
		
		cell = row.createCell(5);
		cell.setCellValue("조회수");
		
		List<SboardVO> list = sboardService.selectBoard();
		
		// 리스트의 Size만큼 row 생성
		SboardVO vo;
		for(int rowIdx = 0; rowIdx < list.size(); rowIdx++) {
			vo = list.get(rowIdx);
			
			row = sheet.createRow(rowIdx + 1);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getNum());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getTitle());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getContent());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getName());
			
			cell = row.createCell(4);
			cell.setCellValue(vo.getRegdate());
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getCount());
		}
		
		// 다운로드 폴더에 응답됨 -> 현호님 코드 참고 (타입, 헤더, 파일명 지정 후 데이터 write)
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=boardDataPoi.xlsx");  // 파일명
		// 데이터 쓰기
		workbook.write(response.getOutputStream());
	}

}