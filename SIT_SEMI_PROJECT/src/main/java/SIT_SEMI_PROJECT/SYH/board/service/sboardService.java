package SIT_SEMI_PROJECT.SYH.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.SYH.board.SboardVO;
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
}
