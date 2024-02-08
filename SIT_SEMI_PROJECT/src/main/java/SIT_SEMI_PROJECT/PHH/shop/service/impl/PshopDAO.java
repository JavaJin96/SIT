package SIT_SEMI_PROJECT.PHH.shop.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.PHH.shop.PshopVO;

@Repository("pshopDAO")
public class PshopDAO extends EgovAbstractMapper{
	
	public List<?> selectShop(){
		return selectList("pshopDAO.selectList");
	}
	
	public int insertShop(PshopVO vo) {
		return insert("pshopDAO.insertShop", vo);
	}
	
	public PshopVO contentShop(int no) {
		return selectOne("pshopDAO.contentShop", no);
	}

}
