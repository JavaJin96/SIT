package SIT_SEMI_PROJECT.RYH.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.RYH.user.RuserVO;
import SIT_SEMI_PROJECT.RYH.user.service.impl.RuserDAO;

@Service("ruserService")
public class RuserService {
	RuserDAO ruserDAO;
	
	public RuserVO doLogin(RuserVO vo) {
		return ruserDAO.doLogin(vo);
	}
}
