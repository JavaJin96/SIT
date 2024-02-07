package SIT_SEMI_PROJECT.PHH.shop.web;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import SIT_SEMI_PROJECT.PHH.board.PboardVO;
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
	
	@RequestMapping(value="phh/pshopWrite.do")
	public ModelAndView writeShop() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pshopWrite");
		return mav;
	}	
	
	@RequestMapping(value="phh/pshopInsert.do")
	public ModelAndView insertBoard(@RequestParam int userNo, @RequestParam String title, @RequestParam String contents, @RequestParam String filename) {
		ModelAndView mav = new ModelAndView();
		PboardVO vo = new PboardVO();
		vo.setUserNo(userNo);
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setFileName(filename);
//		pshopService.insertShop(vo);
		mav.setView(new RedirectView("pshopList.do"));
		return mav;
	}	
	
//	@RequestMapping(value="phh/pfileUpload.do")
//	public ModelAndView fileUpload(@RequestParam MultipartFile file) {
//		ModelAndView mav = new ModelAndView();
//		PshopVO vo = new PshopVO();
//		
//		String savedName = file.getOriginalFilename();
//		savedName = uploadFile(savedName, file.getBytes());
//		
//		
//		return mav;
//	}
	
//	@RequestMapping("/upload.do")
//	public String upload(MultipartHttpServletRequest request, String str)	{
//		String path = request.getSession().getServletContext().getRealPath("/download");
//		
//		MultipartFile file = request.getFile("upload");
//		
//		if(file != null && file.getSize() >0) {
//			try {
//				FileOutputStream fos = new FileOutputStream(path + "/" + file.getOriginalFilename());
//				
//				InputStream is = file.getInputStream();
//				
//				int data;
//				byte[] buffer = new byte[4096];
//				
//				while((data=is.read(buffer, 0, buffer.length)) != -1) {
//					
//					fos.write(buffer, 0, data);
//				}
//				is.close();
//				fos.close();
//				
//			} catch(Exception e) {
//				System.out.println(e.toString());
//				
//			}
//			
//		}
//		
//		return "result";
//	}
	
	@RequestMapping("phh/upload.do")
	public ModelAndView uploadForm(MultipartFile file, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		// 첨부파일이름
		String filename = file.getOriginalFilename();
		String path = request.getSession().getServletContext().getRealPath("/download");
		filename = uploadFile(path, filename, file.getBytes());
//		mav.setView(new RedirectView("pshopList.do"));
		mav.addObject("filename", filename);
		
		return mav;
	}
	
	private String uploadFile(String path, String originalName, byte[] fileData) throws Exception {
		
		UUID uid = UUID.randomUUID();
		String filename = uid.toString()+"_"+originalName; // 고유랜더번호
		
		File target = new File(path, filename);
		
		FileCopyUtils.copy(fileData, target);
		
		return filename;
	}
	
	// multipartrequest : 첨부파일 받을 때 사용.
//	@RequestMapping("/upload.do")
//	public String upload(MultipartHttpServletRequest multipartRequest, HttpServletRequest request, Model model) throws Exception {
//		
////		String UPLOAD_DIR = "repo";
////		String uploadPath = request.getServletContext().getRealPath("/download")+File.separator+UPLOAD_DIR;
//		String uploadPath = request.getServletContext().getRealPath("/download");
//		
//		// id, name
//		Map map = new HashMap(); // (KEY, Value)
//		
////		String id = multipartRequest.getParameter("id");
////		String name = multipartRequest.getParameter("name");
//		// Enumeration -> 나열, 열거형
//		Enumeration<String> e = multipartRequest.getParameterNames(); // id, name
//		while(e.hasMoreElements()) {
//			String name = e.nextElement(); // id
//			String value = multipartRequest.getParameter(name); // name
////			System.out.println(name+":"+value);
//			map.put(name, value);
//		}
//		
//		// 파일을 담고 있는 파라메터 읽어오기
//		Iterator<String> it = multipartRequest.getFileNames(); // 파일이름이 아니라 -> 파라메터 이름(file1, file2...)
//		List<String> fileList = new ArrayList<String>();
//		while(it.hasNext()) {
//			String paramfName = it.next();
////			System.out.println(paramfName);
//			MultipartFile mFile = multipartRequest.getFile(paramfName); // 파일(이름, 타입, 크기 ...)
//			String oName = mFile.getOriginalFilename(); // 실제 업로드된 파일 이름
////			System.out.println(oName); // 진짜 파일 이름이 나온다.
//			fileList.add(oName);
//			// 파일을 업로드 할 경로를 확인?
//			File file = new File(uploadPath+"\\"+paramfName); // file1
//			if(mFile.getSize()!=0) {
//				if(!file.exists()) {
//					if(file.getParentFile().mkdirs()) {
//						file.createNewFile(); // 임시로 파일을 생성한다.
//					} //
//				} //
//				mFile.transferTo(new File(uploadPath+"\\"+oName)); // 파일업로드
//			}
//		} //
//		map.put("fileList", fileList);
//		model.addAttribute("map", map);
//		
//		
//		return "result";
//	}	
	
	
}
