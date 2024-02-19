package SIT_SEMI_PROJECT.SYH.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.SYH.board.SboardVO;
import SIT_SEMI_PROJECT.SYH.board.ScommentsVO;

@Repository("sboardDAO")
public class sboardDAO extends EgovAbstractMapper{
	
	public List<?> selectBoard() {
		return selectList("sboardDAO.selectBoard");
	}
	
	public int insertBoard(SboardVO vo) {
		return insert("sboardDAO.insertBoard", vo);
	}
	
	public SboardVO contentBoard(int num) {
		return selectOne("sboardDAO.contentBoard", num);
	}
	
	public int modifyBoard(SboardVO vo) {
		return update("sboardDAO.modifyBoard", vo);
	}
	
	public int deleteBoard(int num) {
		return delete("sboardDAO.deleteBoard", num);
	}
	
	public List<?> searchBoard(String selectSearch, String search) {
		Map<String, String> map = new HashMap<>();
		map.put("selectSearch", selectSearch);
		map.put("search", search);
		return selectList("sboardDAO.searchBoard", map);
	}
	
	public List<?> selectComments(int num) {
		return selectList("sboardDAO.selectComments", num);
	}
	
	public int insertComments(ScommentsVO vo) {
		return insert("sboardDAO.insertComments", vo);
	}
	
	public int modifyComments(ScommentsVO vo) {
		return update("sboardDAO.modifyComments", vo);
	}
	
	public int deleteComments(int commentsNum) {
		return delete("sboardDAO.deleteComments", commentsNum);
	}
	
	public int countBoard(int num) {
		return update("sboardDAO.countBoard", num);
	}
	
	public int insertNotice(SboardVO vo) {
		return insert("sboardDAO.insertNotice", vo);
	}
	
	public List<?> selectNotice(){
		return selectList("sboardDAO.selectNotice");
	}
	
	public SboardVO contentNotice(int num) {
		return selectOne("sboardDAO.contentNotice", num);
	}
	
	public int getTotalBoardCount() {
        return selectOne("sboardDAO.getTotalBoardCount");
    }
	
	public List<?> getBoardList(int start, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return selectList("sboardDAO.getBoardList", map);
	}
}
