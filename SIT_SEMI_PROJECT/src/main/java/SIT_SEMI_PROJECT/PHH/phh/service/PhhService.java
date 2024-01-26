package SIT_SEMI_PROJECT.PHH.phh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.PHH.phh.service.impl.PhhDAO;

@Service("phhService")
public class PhhService {
	
	@Resource(name = "phhDAO")
	PhhDAO phhDao;
	
	public List<?> selectTest(){
		return phhDao.testSelectAll();
	}

}
