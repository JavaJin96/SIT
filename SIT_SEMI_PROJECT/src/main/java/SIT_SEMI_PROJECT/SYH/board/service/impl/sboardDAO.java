package SIT_SEMI_PROJECT.SYH.board.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.SYH.board.SboardVO;

@Repository("sboardDAO")
public class sboardDAO extends EgovAbstractMapper{
	
	public List<?> selectBoard() {
		return selectList("sboardDAO.selectBoard");
	}
	
	public int insertBoard(SboardVO vo) {
		return insert("sboardDAO.insertBoard", vo);
	}
}
