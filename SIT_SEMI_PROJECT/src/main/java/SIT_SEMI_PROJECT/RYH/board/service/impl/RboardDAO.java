package SIT_SEMI_PROJECT.RYH.board.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.PHH.board.PboardVO;
import SIT_SEMI_PROJECT.RYH.board.RboardVO;

@Repository("rboardDAO")
public class RboardDAO extends EgovAbstractMapper{
	
	public List<?> selectBoard(){
	    return selectList("rboardDAO.selectBoard");
	}
	
	public int insertBoard(RboardVO vo) {
		return insert("rboardDAO.insertBoard", vo);
	}
	
	public RboardVO contentBoard(int no) {
		return selectOne("rboardDAO.contentBoard", no);
	}
	
	public int countBoard(int no) {
		return update("rboardDAO.countBoard", no);
	}

}
