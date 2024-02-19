package SIT_SEMI_PROJECT.PHH.shop.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

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

}
