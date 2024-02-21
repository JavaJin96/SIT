package SIT_SEMI_PROJECT.RYH.board.service;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.RYH.board.RboardVO;
import SIT_SEMI_PROJECT.RYH.board.service.impl.RboardDAO;

@Service("rboardService")
public class RboardService {
	
	@Resource(name = "rboardDAO")
	RboardDAO rboardDao;
	
	public List<?> selectBoard() {
        return rboardDao.selectBoard();
	}
	
	public int insertBoard(RboardVO vo) {
		return rboardDao.insertBoard(vo);
	}
	
	public RboardVO contentBoard(int num) {
		return rboardDao.contentBoard(num);
	}
	
	public int countBoard(int num) {
		return rboardDao.countBoard(num);
	}
	
	public int updateBoard(RboardVO vo) {
		return rboardDao.updateBoard(vo);
	}
	
	public int deleteBoard(int num) {
		return rboardDao.deleteBoard(num);
	}
	
	public List<?> searchBoard(String search){
		return rboardDao.searchBoard(search);
	}
	
	
}
