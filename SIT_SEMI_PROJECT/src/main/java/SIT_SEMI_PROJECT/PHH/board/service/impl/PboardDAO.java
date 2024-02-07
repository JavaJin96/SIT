package SIT_SEMI_PROJECT.PHH.board.service.impl;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.PHH.board.PboardVO;
import SIT_SEMI_PROJECT.PHH.board.PcommentVO;

@Repository("pboardDAO")
public class PboardDAO extends EgovAbstractMapper{
	
	public List<?> selectBoard(){
		return selectList("pboardDAO.selectBoard");
	}
	
	public List<?> searchBoard(String selectSearch, String search) {
		Map<String, String> para = new HashMap<>();
		para.put("selectSearch", selectSearch);
		para.put("search", search);
		return selectList("pboardDAO.searchBoard", para);
	}

	
	public int insertBoard(PboardVO vo) {
		return insert("pboardDAO.insertBoard", vo);
	}
	
	public int updateBoard(PboardVO vo) {
		return update("pboardDAO.updateBoard", vo);
	}
	
	public int countBoard(int no) {
		return update("pboardDAO.countBoard", no);
	}
	
	public int deleteBoard(int no) {
		return delete("pboardDAO.deleteBoard", no);
	}
	
	public PboardVO viewBoard(int no) {
		return selectOne("pboardDAO.viewBoard", no);
	}
	
	public List<?> viewComment(int no) {
		return selectList("pboardDAO.viewComment", no);
	}	
	
	public List<?> selectNoticeBoard(){
		return selectList("pboardDAO.selectNoticeBoard");
	}
	
	public List<?> searchNoticeBoard(String selectSearch, String search) {
		Map<String, String> para = new HashMap<>();
		para.put("selectSearch", selectSearch);
		para.put("search", search);
		return selectList("pboardDAO.searchNoticeBoard", para);
	}	
	
	public int insertNoticeBoard(PboardVO vo) {
		return insert("pboardDAO.insertNoticeBoard", vo);
	}
	
	public int insertComment(PcommentVO vo) {
		return insert("pboardDAO.insertComment", vo);
	}
	
	public int deleteComment(int replyNo) {
		return delete("pboardDAO.deleteComment", replyNo);
	}
	
	

}
