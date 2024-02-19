package SIT_SEMI_PROJECT.PHH.shop.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import SIT_SEMI_PROJECT.PHH.shop.PshopVO;
import SIT_SEMI_PROJECT.PHH.shop.service.PshopService;

@Controller
public class PshopController {

	@Resource(name = "pshopService")
	PshopService pshopService;
	
	@RequestMapping(value="phh/pshopList.do")
	public ModelAndView goShop() {
		ModelAndView mav = new ModelAndView();
		List<?> list = pshopService.selectShop();
		mav.addObject("list", list);		
		mav.setViewName("pshopList");
		return mav;
	}
	
	@RequestMapping(value="phh/psearchShop.do")
	public ModelAndView searchShop(@RequestParam String selectSearch, @RequestParam String search) {
		ModelAndView mav = new ModelAndView();
		List<?> list = pshopService.searchShop(selectSearch, search);
		mav.addObject("list", list);		
		mav.addObject("selectSearch", selectSearch);
		mav.setViewName("pshopList");
		return mav;
	}
	
	@RequestMapping(value="phh/pshopWrite.do")
	public ModelAndView writeShop() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pshopWrite");
		return mav;
	}	
	
	@RequestMapping(value="phh/pshopInsert.do")
	public ModelAndView insertShop(@RequestParam int userNo, @RequestParam String title, @RequestParam String contents, @RequestParam String fileName, @RequestParam int price) {
		ModelAndView mav = new ModelAndView();
		PshopVO vo = new PshopVO();
		vo.setUserNo(userNo);
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setFileName(fileName);
		vo.setPrice(price);
		pshopService.insertShop(vo);
		mav.setView(new RedirectView("pshopList.do"));
		return mav;
	}
	
	@RequestMapping(value="phh/pshopDelete.do")
	public ModelAndView deleteShop(@RequestParam int no) {
		ModelAndView mav = new ModelAndView();
		pshopService.deleteShop(no);
		mav.setView(new RedirectView("pshopList.do"));
		return mav;
	}	
	
	@RequestMapping(value="phh/pshopContent.do")
	public ModelAndView viewShop(@RequestParam int no) {
		ModelAndView mav = new ModelAndView();
		PshopVO vo = pshopService.contentshop(no);
		mav.addObject("vo", vo);
		mav.setViewName("pshopContent");
		return mav;
	}
	
	@RequestMapping(value="phh/pshopUpdatePage.do")
	public ModelAndView updatepageShop(@RequestParam int no) {
		ModelAndView mav = new ModelAndView();
		PshopVO vo = pshopService.contentshop(no);
		mav.addObject("vo", vo);
		mav.setViewName("pshopUpdatePage");
		return mav;
	}
	
	@RequestMapping(value="phh/pshopUpdate.do")
	public ModelAndView updateShop(@RequestParam int no, @RequestParam String title, @RequestParam String contents, @RequestParam String fileName, @RequestParam int price, @RequestParam int gubun) {
		ModelAndView mav = new ModelAndView();
		PshopVO vo = new PshopVO();
		vo.setNo(no);
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setFileName(fileName);
		vo.setPrice(price);
		vo.setGubun(gubun);
		
		pshopService.updateShop(vo);
		
		mav.setView(new RedirectView("pshopList.do"));
		return mav;
	}
	
	@RequestMapping("phh/pupload.do")
	@ResponseBody
	public Map<String, String> uploadForm(MultipartFile file, HttpServletRequest request) throws Exception {
		Map<String, String> response = new HashMap<>();
		
		// 첨부파일이름
		String fileName = file.getOriginalFilename();
		
//		String path = request.getSession().getServletContext().getRealPath("/download");
		String path = "C:/Users/SIT/git/SIT/SIT_SEMI_PROJECT/src/main/webapp/download";
		
		fileName = uploadFile(path, fileName, file.getBytes());
		response.put("fileName", fileName);
		
		return response;
	}
	
	private String uploadFile(String path, String originalName, byte[] fileData) throws Exception {
		
		UUID uid = UUID.randomUUID();
		String fileName = uid.toString()+"_"+originalName; // 고유랜더번호
		
		File target = new File(path, fileName);
		
		FileCopyUtils.copy(fileData, target);
		
		return fileName;
	}
	

	
	// 미구현 (상품 주문 기능 먼저 만든 뒤 구현 예정)
	@RequestMapping("phh/pshopCommentWrite.do")
	public ModelAndView insertShopComment(@RequestParam int userNo, @RequestParam String title, @RequestParam String contents, @RequestParam String fileName, @RequestParam int price) {
		ModelAndView mav = new ModelAndView();
		PshopVO vo = new PshopVO();
		vo.setUserNo(userNo);
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setFileName(fileName);
		vo.setPrice(price);
		pshopService.insertShop(vo);
		mav.setView(new RedirectView("pshopList.do"));
		return mav;
	}
	
	
}
