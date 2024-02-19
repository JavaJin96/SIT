package SIT_SEMI_PROJECT.SYH.user.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.SYH.user.SuserVO;

@Repository("suserDAO")
public class suserDAO extends EgovAbstractMapper{
	
	public List<?> selectUser() {
		return selectList("suserDAO.selectUser");
	}
	
	public int insertUser(SuserVO vo) {
		return insert("suserDAO.insertUser", vo);
	}
	
	public int deleteUser(int no) {
		return delete("suserDAO.deleteUser", no);
	}
	
	public SuserVO doLogin(SuserVO vo) {
		return selectOne("suserDAO.doLogin", vo);
	}
	
	public String dbCheck(String id) {
		return selectOne("suserDAO.dbCheck", id);
	}
	
	public String nameCheck(String name) {
		return selectOne("suserDAO.nameCheck", name);
	}
}