package SIT_SEMI_PROJECT.SYH.shopping.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import SIT_SEMI_PROJECT.SYH.shopping.SshoppingVO;

@Repository("sshoppingDAO")
public class sshoppingDAO extends EgovAbstractMapper{
	
	public List<SshoppingVO> shopList(){
		return selectList("sshoppingDAO.shopList");
	}
	
	public int insertProduct(SshoppingVO vo) {  // 상품 등록
		return insert("sshoppingDAO.insertProduct", vo);
	}
	
	public SshoppingVO contentProduct(int num) {
		return selectOne("sshoppingDAO.contentProduct", num);
	}
	
	public int modifyProduct(SshoppingVO vo) {
		return update("sshoppingDAO.modifyProduct", vo);
	}
	
	public int deleteProduct(int num) {
		return delete("sshoppingDAO.deleteProduct", num);
	}
}