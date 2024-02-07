package SIT_SEMI_PROJECT.RYH.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.RYH.board.service.impl.RboardDAO;

@Service("rboardService")
public class RboardService {
	@Resource(name = "rboardDAO")
	RboardDAO rboardDao;
	
	public List<?> selectBoard() {
        return rboardDao.selectBoard();
	}
}
