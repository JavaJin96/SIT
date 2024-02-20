package SIT_SEMI_PROJECT.SYH.shopping.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

@Repository("sshoppingDAO")
public class sshoppingDAO extends EgovAbstractMapper{
	
	public List<sshoppingDAO> shopList(){
		return selectList("sshoppingDAO.shopList");
	}
}
