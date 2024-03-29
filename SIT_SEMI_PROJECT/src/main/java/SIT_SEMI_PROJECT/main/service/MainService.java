package SIT_SEMI_PROJECT.main.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.main.BoardVO;
import SIT_SEMI_PROJECT.main.MemberVO;
import SIT_SEMI_PROJECT.main.service.impl.MainDAO;

@Service("mainService")
public class MainService {
	
	@Resource(name = "mainDAO")
	MainDAO mainDao;
	
	public List<?> selectTestMember(){
		return mainDao.testSelectAll();
	}
	
	public MemberVO selectLogin(MemberVO loginMember) {
		return mainDao.selectLogin(loginMember);
	}
	
	public List<?> selectAllBoard(){
		return mainDao.selectAllBoard();
	}
	
	public void insertBoard(BoardVO bvo) {
		mainDao.insertBoard(bvo);
	}
	
	public BoardVO selectBoard(BoardVO bvo) {
		return mainDao.selectBoard(bvo);
	}
	
	public void updateBoard(BoardVO bvo) {
		mainDao.updateBoard(bvo);
	}
	
	public void deleteBoard(BoardVO bvo) {
		mainDao.deleteBoard(bvo);
	}
	
	public MemberVO validationMember(MemberVO mvo) {
		return mainDao.validationMember(mvo);
	}
	
	public void joinMember(MemberVO mvo) {
		mainDao.joinMember(mvo);
	}
	
}
