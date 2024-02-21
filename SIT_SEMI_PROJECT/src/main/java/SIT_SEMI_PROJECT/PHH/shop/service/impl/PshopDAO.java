package SIT_SEMI_PROJECT.PHH.shop.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.PHH.shop.PreviewVO;
import SIT_SEMI_PROJECT.PHH.shop.PshopVO;

@Repository("pshopDAO")
public class PshopDAO extends EgovAbstractMapper{
	
	public List<?> selectShop(){
		return selectList("pshopDAO.selectList");
	}
	
	public List<?> searchShop(String selectSearch, String search){
		Map<String, String> para = new HashMap<>();
		para.put("selectSearch", selectSearch);
		para.put("search", search);
		return selectList("pshopDAO.searchShop", para);
	}
	
	public int insertShop(PshopVO vo) {
		return insert("pshopDAO.insertShop", vo);
	}
	
	public PshopVO contentShop(int no) {
		return selectOne("pshopDAO.contentShop", no);
	}
	
	public int deleteShop(int no) {
		return update("pshopDAO.deleteShop", no);
	}
	
	public int updateShop(PshopVO vo) {
		return update("pshopDAO.updateShop", vo);
	}
	
	public int putCart(PshopVO vo) {
		return insert("pshopDAO.putCart", vo);
	}
	
	public List<PshopVO> listCart(int userNo){
		return selectList("pshopDAO.listCart", userNo);
	}
	
	public int deleteCart(int cartNo) {
		return update("pshopDAO.deleteCart", cartNo);
	}
	
	public int putSell(PshopVO vo) {
		return insert("pshopDAO.putSell", vo);
	}
	
	public int sellShop(PshopVO vo) {
		return update("pshopDAO.sellShop", vo);
	}		
	
	public int sellCart(int cartNo) {
		return update("pshopDAO.sellCart", cartNo);
	}
	
	public List<PshopVO> sellList(){
		return selectList("pshopDAO.sellList");
	}
	
	public List<?> viewReview(int no){
		return selectList("pshopDAO.viewReview", no);
	}
	
	public int checkSell(int userNo, int no) {
		Map<String, Integer> para = new HashMap<>();
		para.put("userNo", userNo);
		para.put("no", no);
		Integer result = selectOne("pshopDAO.checkSell", para);
		if(result != null) {
			
		}else {
			result = -1;
		}
		 return result;
	}
	
	public int doReview(PreviewVO vo) {
		return insert("pshopDAO.doReview", vo);
	}

}
