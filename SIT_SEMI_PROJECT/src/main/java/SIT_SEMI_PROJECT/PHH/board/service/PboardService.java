package SIT_SEMI_PROJECT.PHH.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.PHH.board.PboardVO;
import SIT_SEMI_PROJECT.PHH.board.PcommentVO;
import SIT_SEMI_PROJECT.PHH.board.service.impl.PboardDAO;

@Service("pboardService")
public class PboardService {
	
	@Resource(name = "pboardDAO")
	PboardDAO pboardDao;
	
	public List<?> selectBoard(){
		return pboardDao.selectBoard();
	}
	
	public int insertBoard(PboardVO vo) {
		return pboardDao.insertBoard(vo);
	}
	
	public int updateBoard(PboardVO vo) {
		return pboardDao.updateBoard(vo);
	}
	
	public int countBoard(int no) {
		return pboardDao.countBoard(no);
	}
	
	public int deleteBoard(int no) {
		return pboardDao.deleteBoard(no);
	}
	
	public PboardVO viewBoard(int no) {
		return pboardDao.viewBoard(no);
	}
	
	public List<?> viewComment(int no) {
		return pboardDao.viewComment(no);
	}	
	
	public List<?> selectNoticeBoard(){
		return pboardDao.selectNoticeBoard();
	}	
	
	public int insertNoticeBoard(PboardVO vo) {
		return pboardDao.insertNoticeBoard(vo);
	}
	
	public int insertComment(PcommentVO vo) {
		return pboardDao.insertComment(vo);
	}
	
	public int deleteComment(int replyNo) {
		return pboardDao.deleteComment(replyNo);
	}
	
	
}
