package SIT_SEMI_PROJECT.PHH.shop.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;

import SIT_SEMI_PROJECT.PHH.shop.PreviewVO;
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
	public ModelAndView viewShop(@RequestParam int no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		int chk = 0;
		HttpSession session = request.getSession();
		if(session.getAttribute("userNo") != null) {
		Integer userNo = (Integer) session.getAttribute("userNo");
		System.out.println(userNo);
		System.out.println("구매여부 확인");
		chk = pshopService.checkSell(userNo, no);
		System.out.println("쿼리문 이상 X");
		mav.addObject("chk", chk);
		System.out.println(chk);
		}
		
		List<?> co = pshopService.viewReview(no);
		PshopVO vo = pshopService.contentshop(no);
		mav.addObject("vo", vo);
		mav.addObject("co", co);
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
	
	@RequestMapping("phh/pshopPutCart.do")
	public ModelAndView putCart(@RequestParam int userNo, @RequestParam int shopNo, @RequestParam int count) {
		ModelAndView mav = new ModelAndView();
		PshopVO vo = new PshopVO();
		
		vo.setUserNo(userNo);
		vo.setShopNo(shopNo);
		vo.setCount(count);
		pshopService.putCart(vo);
		
//		List<PshopVO> list = pshopService.listCart(userNo);
//		mav.addObject("list", list);
		
		mav.setView(new RedirectView("pshopCart.do?userNo=" + userNo));
		
		return mav;
	}
	
	@RequestMapping("phh/pshopCart.do")
	public ModelAndView goCart(@RequestParam int userNo) {
		ModelAndView mav = new ModelAndView();
		
		List<PshopVO> list = pshopService.listCart(userNo);
		
		mav.addObject("list", list);
		mav.setViewName("pshopCart");
		
		return mav;
	}
	
	@RequestMapping("phh/pshopDeleteCart.do")
	public ModelAndView deleteCart(@RequestParam int cartNo, @RequestParam int userNo) {
		ModelAndView mav = new ModelAndView();
		
		pshopService.deleteCart(cartNo);
		mav.setView(new RedirectView("pshopCart.do?userNo=" + userNo));
		
		return mav;
	}
	
	@RequestMapping("phh/pshopBuyCart.do")
	public ModelAndView BuyCart(@RequestParam int userNo) {
		ModelAndView mav = new ModelAndView();
		
		List<PshopVO> list = pshopService.listCart(userNo);
		
		for(PshopVO vo : list) {
			int cartNo = vo.getCartNo();
			int shopNo = vo.getShopNo();
			int count = vo.getCount();
			int price = vo.getPrice();
			
			int totalPrice = count * price;
			
			PshopVO vo2 = new PshopVO();
			PshopVO vo3 = new PshopVO();
			
			vo2.setShopNo(shopNo);
			vo2.setCount(count);
			vo2.setTotalPrice(totalPrice);
			vo2.setUserNo(userNo);
			
			vo3.setShopNo(shopNo);
			vo3.setSell(count);
			
			pshopService.putSell(vo2);
			pshopService.sellShop(vo3);
			pshopService.sellCart(cartNo);
		
		}
		
		mav.setView(new RedirectView("pshopList.do"));
		
		
		return mav;
		
	}
	
	// google-gson
	// String->JSON : EZ
	// list -> JSON : gson 쓰면 좋다. 
	@RequestMapping(value = "phh/pshopSellList.do")
	public ModelAndView goSellList() {
		ModelAndView mav = new ModelAndView();
		List <PshopVO> list = pshopService.sellList();
		
		List<Map<String, Object>> data = new ArrayList<>();
		for (PshopVO vo : list) {
			Map<String, Object> dataPoint = new HashMap<>();
			dataPoint.put("sellDate", vo.getSellDate());
//			dataPoint.put("date", vo.getDate());
//			dataPoint.put("totalPrice", vo.getTotalPrice()+"");
			dataPoint.put("totalPrice", vo.getTotalPrice());
			data.add(dataPoint);
		}
		Gson gson = new Gson();
		String gsonData = gson.toJson(data);
		mav.addObject("gsonData", gsonData);
		mav.addObject("data", data);
		
		mav.setViewName("pshopSellList");
		return mav;
	}

	
	// 상품리뷰
	@RequestMapping("phh/pshopReviewWrite.do")
	public ModelAndView doReview(@RequestParam int shopNo, @RequestParam int userNo, @RequestParam String review, @RequestParam String fileName) {
		ModelAndView mav = new ModelAndView();
		PreviewVO vo = new PreviewVO();
		vo.setUserNo(userNo);
		vo.setReview(review);
		vo.setShopNo(shopNo);
	    if (fileName != "") {
	        vo.setFileName(fileName);
	    }
		pshopService.doReview(vo);
		mav.setView(new RedirectView("pshopContent.do?no=" + shopNo));
		return mav;
	}
	
	
}
