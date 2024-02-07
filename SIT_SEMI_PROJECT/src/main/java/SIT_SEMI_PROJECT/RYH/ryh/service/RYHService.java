package SIT_SEMI_PROJECT.RYH.ryh.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.RYH.ryh.service.impl.RYHDAO;

@Service("ryhService")
public class RYHService {
	@Resource(name = "ryhDao")
	RYHDAO ryhDao;
}
