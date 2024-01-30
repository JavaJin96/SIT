package SIT_SEMI_PROJECT.PHH.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.PHH.board.PboardVO;
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
	
	
}
