package SIT_SEMI_PROJECT.PHH.user.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.PHH.user.PuserVO;

@Repository("puserDAO")
public class PuserDAO extends EgovAbstractMapper{
	
	public List<?> selectUser(){
		return selectList("puserDAO.selectUser");
	}
	
	public int deleteUser(int no) {
		return delete("puserDAO.deleteUser", no);
	}
	
	public int insertUser(PuserVO vo) {
		return insert("puserDAO.insertUser", vo);
	}
	
	public PuserVO doLogin(PuserVO vo) {
		return selectOne("puserDAO.doLogin", vo);
	}
	
}
