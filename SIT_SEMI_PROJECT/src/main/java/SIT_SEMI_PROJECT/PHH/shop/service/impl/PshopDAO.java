package SIT_SEMI_PROJECT.PHH.shop.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

@Repository("pshopDAO")
public class PshopDAO extends EgovAbstractMapper{
	
	public List<?> selectShop(){
		return selectList("pshopDAO.selectList");
	}

}
