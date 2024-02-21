package SIT_SEMI_PROJECT.RYH.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.RYH.board.RboardVO;

@Repository("rboardDAO")
public class RboardDAO extends EgovAbstractMapper{
	
	public List<?> selectBoard(){
	    return selectList("rboardDAO.selectBoard");
	}
	
	public int insertBoard(RboardVO vo) {
		return insert("rboardDAO.insertBoard", vo);
	}
	
	public RboardVO contentBoard(int num) {
		return selectOne("rboardDAO.contentBoard", num);
	}
	
	public int countBoard(int num) {
		return update("rboardDAO.countBoard", num);
	}
	
	public int updateBoard(RboardVO vo) {
		return update("rboardDAO.updateBoard", vo);
	}
	
	public int deleteBoard(int num) {
		return delete("rboardDAO.deleteBoard", num);
	}
	
	public List<?> searchBoard(String search) {
		Map<String, String> para = new HashMap<>();
		para.put("search", search);
		return selectList("rboardDAO.searchBoard", para);
	}
	
}
