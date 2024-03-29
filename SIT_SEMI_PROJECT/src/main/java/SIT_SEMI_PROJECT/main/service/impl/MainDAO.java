package SIT_SEMI_PROJECT.main.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.main.BoardVO;
import SIT_SEMI_PROJECT.main.MemberVO;

@Repository("mainDAO")
public class MainDAO extends EgovAbstractMapper{
	
	public List<?> testSelectAll(){
		return selectList("mainDAO.testSelectAll");
	}
	
	public MemberVO selectLogin(MemberVO loginMember) {
		return selectOne("mainDAO.selectLogin", loginMember);
	}
	
	public List<?> selectAllBoard(){
		return selectList("mainDAO.selectAllBoard");
	}
	
	public void insertBoard(BoardVO bvo) {
		insert("mainDAO.insertBoard", bvo);
	}
	
	public BoardVO selectBoard(BoardVO bvo) {
		return selectOne("mainDAO.selectBoard", bvo);
	}
	
	public void updateBoard(BoardVO bvo) {
		update("mainDAO.updateBoard" , bvo);
	}
	
	public void deleteBoard(BoardVO bvo) {
		delete("mainDAO.deleteBoard" , bvo);
	}
	
	public MemberVO validationMember(MemberVO mvo) {
		return selectOne("mainDAO.validationMember", mvo);
	}
	
	public void joinMember(MemberVO mvo) {
		insert("mainDAO.joinMember", mvo);
	}
	
	
	
}
