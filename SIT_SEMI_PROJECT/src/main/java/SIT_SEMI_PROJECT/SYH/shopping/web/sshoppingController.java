package SIT_SEMI_PROJECT.SYH.shopping.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import SIT_SEMI_PROJECT.SYH.shopping.SshoppingVO;
import SIT_SEMI_PROJECT.SYH.shopping.service.sshoppingService;
import SIT_SEMI_PROJECT.SYH.shopping.service.impl.sshoppingDAO;

@Controller
public class sshoppingController {

	@Resource(name = "sshoppingService")
	sshoppingService sshoppingService;
	
	@RequestMapping(value="syh/sshoppingMain.do")
	public ModelAndView sshoppingMain() {
		ModelAndView mav = new ModelAndView();
		
		List<sshoppingDAO> list = sshoppingService.shopList();
		
		mav.addObject("list", list);
		mav.setViewName("sshoppingMain");
		return mav;
	}
	
	@RequestMapping(value = "syh/regProductPage.do")  // 상품 등록 페이지
	public ModelAndView regProductPage() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("regProductPage");
		return mav;
	}
	
	@RequestMapping(value = "syh/insertProduct.do")  // 상품 실제 등록
	public ModelAndView insertProduct(int userNum, String prodTitle, 
			String prodContents, String fileName, int price) {
		ModelAndView mav = new ModelAndView();
		
		SshoppingVO vo = new SshoppingVO();
		vo.setUserNum(userNum);
		vo.setProdTitle(prodTitle);
		vo.setProdContents(prodContents);
		vo.setFileName(fileName);
		vo.setPrice(price);
		
		sshoppingService.insertProduct(vo);
		
		mav.setView(new RedirectView("sshoppingMain.do"));
		return mav;
	}
	
	
}