package SIT_SEMI_PROJECT.PSJ.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.PSJ.service.impl.PsjDAO;

@Service("psjService")
public class PsjService {

	@Resource(name = "psjDao")
	PsjDAO psjDao;
	
}
