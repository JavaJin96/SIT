package SIT_SEMI_PROJECT.PHH.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.PHH.user.PuserVO;
import SIT_SEMI_PROJECT.PHH.user.service.impl.PuserDAO;

@Service("puserService")
public class PuserService {
	
	@Resource(name = "puserDAO")
	PuserDAO puserDao;
	
	public List<?> selectUser(){
		return puserDao.selectUser();
	}
	
	public int deleteUser(int no){
		return puserDao.deleteUser(no);
	}	
	
	public int insertUser(PuserVO vo) {
		return puserDao.insertUser(vo);
	}
	
	public PuserVO doLogin(PuserVO vo) {
		return puserDao.doLogin(vo);
	}
	
	public String dbCheck(String id) {
		return puserDao.dbCheck(id);
		
	}


}
