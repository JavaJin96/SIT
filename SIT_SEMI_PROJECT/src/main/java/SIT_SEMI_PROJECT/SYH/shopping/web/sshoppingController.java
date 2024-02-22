package SIT_SEMI_PROJECT.SYH.shopping.web;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import SIT_SEMI_PROJECT.SYH.shopping.SshoppingVO;
import SIT_SEMI_PROJECT.SYH.shopping.service.sshoppingService;
import SIT_SEMI_PROJECT.SYH.shopping.service.impl.sshoppingDAO;
import SIT_SEMI_PROJECT.SYH.user.SuserVO;

@Controller
public class sshoppingController {

	@Resource(name = "sshoppingService")
	sshoppingService sshoppingService;
	
	@RequestMapping(value="syh/sshoppingMain.do")
	public ModelAndView sshoppingMain() {
		ModelAndView mav = new ModelAndView();
		
		List<SshoppingVO> list = sshoppingService.shopList();
		
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
	
	@RequestMapping(value = "syh/uploadForm.do")
	@ResponseBody  // 서버 -> 클라이언트로 응답 데이터 전송 (Map을 http 응답의 json형식으로 변환 후 전송)
	public Map<String, String> uploadForm(MultipartFile file, HttpServletRequest request) throws Exception {  // 파일 업로드처리
		Map<String, String> response = new HashMap<>();
		
		String fileName = file.getOriginalFilename();  // 원래의 파일명
		// String path = request.getSession().getServletContext().getRealPath("/download");  // 파일경로
		String path = "C:/Users/SIT/git/SIT/SIT_SEMI_PROJECT/src/main/webapp/download";
		// String path = "C:\\Users\\SIT\\git\\SIT\\SIT_SEMI_PROJECT\\src\\main\\webapp\\download";
		
		
		fileName = uploadFile(path, fileName, file.getBytes());  // 파일 업로드 후 얻은 파일명을 fileName에 저장
		
		response.put("fileName", fileName);
		return response;
	}
	
	private String uploadFile(String path, String originalName, byte[] fileData) throws Exception {  // 파일 저장
		UUID uuid = UUID.randomUUID();  // 네트워크 상에서 고유 id
		String fileName = uuid.toString() + "_" + originalName;  // 새 파일명 생성
		
		File target = new File(path, fileName);  // 저장될 파일의 경로와 파일명 설정
		FileCopyUtils.copy(fileData, target);	 // 파일을 지정된 경로에 복사
		
		return fileName;
	}
	
	
	@RequestMapping(value = "syh/regProductContent.do")
	public ModelAndView regProductContent(int num) {
		ModelAndView mav = new ModelAndView();
		
		sshoppingService.contentProduct(num);
		SshoppingVO vo = sshoppingService.contentProduct(num);
		mav.addObject("vo", vo);
		
		mav.setViewName("regProductContent");
		return mav;
		
	}
	
	@RequestMapping(value = "syh/modProductPage.do")
	public ModelAndView modProductPage(int num) {
		ModelAndView mav = new ModelAndView();
		
		SshoppingVO vo = sshoppingService.contentProduct(num);
		mav.addObject("vo", vo);		
		mav.setViewName("modProductPage");
		return mav;
	}
	
	@RequestMapping(value = "syh/modifyProduct.do")
	public ModelAndView modifyProduct(int num, String prodTitle, String prodContents,
			int price) {
		ModelAndView mav = new ModelAndView();
		SshoppingVO vo = new SshoppingVO();
		
		vo.setNum(num);
		vo.setProdTitle(prodTitle);
		vo.setProdContents(prodContents);
		vo.setPrice(price);
		
		sshoppingService.modifyProduct(vo);
		mav.setView(new RedirectView("sshoppingMain.do"));
		
		return mav;
	}
	
	@RequestMapping(value = "syh/prodList.do")
	public ModelAndView prodList() {  // 유저 리스트 (유저 관리)
		ModelAndView mav = new ModelAndView();
		
		List<SshoppingVO> list = sshoppingService.shopList();
		mav.addObject("list", list);
		mav.setViewName("prodList");
		
		return mav;
	}
	
	@RequestMapping(value = "syh/deleteProduct.do")
	public ModelAndView deleteProduct(int num) {
		ModelAndView mav = new ModelAndView();
		
		sshoppingService.deleteProduct(num);
		mav.setView(new RedirectView("sshoppingMain.do"));
		
		return mav;
	}
	
}