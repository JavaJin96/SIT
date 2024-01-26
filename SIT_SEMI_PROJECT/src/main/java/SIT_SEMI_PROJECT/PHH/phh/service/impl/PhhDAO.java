package SIT_SEMI_PROJECT.PHH.phh.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

@Repository("phhDAO")
public class PhhDAO extends EgovAbstractMapper{
	
	public List<?> testSelectAll(){
		return selectList("phhDAO.testSelectAll");
	}
	

}
