package SIT_SEMI_PROJECT.SYH.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.SYH.service.impl.syhDAO;

@Service("SyhService")
public class SyhService {
	
	@Resource(name = "syhDAO")
	syhDAO syhDAO;
}
