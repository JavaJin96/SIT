package SIT_SEMI_PROJECT.RYH.user.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.PHH.user.PuserVO;
import SIT_SEMI_PROJECT.RYH.user.RuserVO;

@Repository("ruserDAO")
public class RuserDAO extends EgovAbstractMapper{
	
	public RuserVO doLogin(RuserVO vo) {
		return selectOne("ruserDAO.doLogin", vo);
		
	}
}
