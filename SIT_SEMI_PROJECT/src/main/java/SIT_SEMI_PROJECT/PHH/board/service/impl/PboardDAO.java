package SIT_SEMI_PROJECT.PHH.board.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.PHH.board.PboardVO;

@Repository("pboardDAO")
public class PboardDAO extends EgovAbstractMapper{
	
	public List<?> selectBoard(){
		return selectList("pboardDAO.selectBoard");
	}
	
	public int insertBoard(PboardVO vo) {
		return insert("pboardDAO.insertBoard", vo);
	}
	
	public PboardVO viewBoard(int no) {
		return selectOne("pboardDAO.viewBoard", no);
	}

}
