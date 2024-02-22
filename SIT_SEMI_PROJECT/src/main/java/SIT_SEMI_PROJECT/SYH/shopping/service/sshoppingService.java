package SIT_SEMI_PROJECT.SYH.shopping.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.SYH.shopping.SshoppingVO;
import SIT_SEMI_PROJECT.SYH.shopping.service.impl.sshoppingDAO;

@Service("sshoppingService")
public class sshoppingService {
	
	@Resource(name = "sshoppingDAO")
	sshoppingDAO sshoppingDao;
	
	public List<SshoppingVO> shopList(){
		return sshoppingDao.shopList();
	}
	
	public int insertProduct(SshoppingVO vo) {
		return sshoppingDao.insertProduct(vo);
	}
	
	public SshoppingVO contentProduct(int num) {
		return sshoppingDao.contentProduct(num);
	}
	
	public int modifyProduct(SshoppingVO vo) {
		return sshoppingDao.modifyProduct(vo);
	}
	
	public int deleteProduct(int num) {
		return sshoppingDao.deleteProduct(num);
	}
}