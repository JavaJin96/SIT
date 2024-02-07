package SIT_SEMI_PROJECT.RYH.board.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

@Repository("rboardDAO")
public class RboardDAO extends EgovAbstractMapper{
	
	public List<?> selectBoard(){
	    return selectList("RboardDAO.selectBoard");
	}

}
