package SIT_SEMI_PROJECT.PHH.board.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.PHH.board.PboardVO;
import SIT_SEMI_PROJECT.PHH.board.PcommentVO;

@Repository("pboardDAO")
public class PboardDAO extends EgovAbstractMapper{
	
	public List<?> selectBoard(){
		return selectList("pboardDAO.selectBoard");
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
	
	public int insertNoticeBoard(PboardVO vo) {
		return insert("pboardDAO.insertNoticeBoard", vo);
	}	
	
	

}
