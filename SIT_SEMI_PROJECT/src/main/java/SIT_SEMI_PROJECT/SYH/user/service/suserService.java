package SIT_SEMI_PROJECT.SYH.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.SYH.user.SuserVO;
import SIT_SEMI_PROJECT.SYH.user.service.impl.suserDAO;

@Service("suserService")
public class suserService {
	
	@Resource(name = "suserDAO")
	suserDAO suserDao;
	
	public int insertUser(SuserVO vo) {
		return suserDao.insertUser(vo);
	}
	
	public List<SuserVO> selectUser() {
		return suserDao.selectUser();
	}
	
	public int deleteUser(int no) {
		return suserDao.deleteUser(no);
	}	
	
	public SuserVO doLogin(SuserVO vo) {
		return suserDao.doLogin(vo);
	}
	
	public String dbCheck(String id) {
		return suserDao.dbCheck(id);
	}
	
	public String nameCheck(String name) {
		return suserDao.nameCheck(name);
	}
}