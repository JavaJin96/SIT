package SIT_SEMI_PROJECT.SYH.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.SYH.board.SboardVO;
import SIT_SEMI_PROJECT.SYH.board.ScommentsVO;
import SIT_SEMI_PROJECT.SYH.board.service.impl.sboardDAO;

@Service("sboardService")
public class sboardService {

	@Resource(name = "sboardDAO")
	sboardDAO sboardDao;
	
	public List<?> selectBoard() {
		return sboardDao.selectBoard();
	}
	
	public int insertBoard(SboardVO vo) {
		return sboardDao.insertBoard(vo);
	}
	
	public SboardVO contentBoard(int num) {
		return sboardDao.contentBoard(num);
	}
	
	public int modifyBoard(SboardVO vo) {
		return sboardDao.modifyBoard(vo);
	}
	
	public int deleteBoard(int num) {
		return sboardDao.deleteBoard(num);
	}
	
	public List<?> searchBoard(String selectSearch, String search) {
		return sboardDao.searchBoard(selectSearch, search);
	}
	
	public List<?> selectComments(int num) {
		return sboardDao.selectComments(num);
	}
	
	public int insertComments(ScommentsVO vo) {
		return sboardDao.insertComments(vo);
	}
	
	public int modifyComments(ScommentsVO vo) {
		return sboardDao.modifyComments(vo);
	}
	
	public int deleteComments(int commentsNum) {
		return sboardDao.deleteComments(commentsNum);
	}
	
	public int countBoard(int num) {
		return sboardDao.countBoard(num);
	}
	
	public int insertNotice(SboardVO vo) {
		return sboardDao.insertNotice(vo);
	}
	
	public List<?> selectNotice(){
		return sboardDao.selectNotice();
	}
	
	public SboardVO contentNotice(int num) {
		return sboardDao.contentNotice(num);
	}
	
	public int getTotalBoardCount() {
        return sboardDao.getTotalBoardCount();
    }
	
	public List<?> getBoardList(int start, int end) {
		return sboardDao.getBoardList(start, end);
	}
	
	public int getTotalCommentsCount(int num) {
        return sboardDao.getTotalCommentsCount(num);
    }
	
	public List<?> getCommentsList(int boardNum, int cstart, int cend) {
		return sboardDao.getCommentsList(boardNum, cstart, cend);
	}
}
