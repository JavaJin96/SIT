package SIT_SEMI_PROJECT.PHH.shop.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.PHH.shop.PshopVO;
import SIT_SEMI_PROJECT.PHH.shop.service.impl.PshopDAO;

@Service("pshopService")
public class PshopService {

	@Resource(name = "pshopDAO")
	PshopDAO pshopDao;
	
	public List<?> selectShop(){
		return pshopDao.selectShop();
	}
	
	public List<?> searchShop(String selectSearch, String search){
		return pshopDao.searchShop(selectSearch, search);
	}
	
	public int insertShop(PshopVO vo) {
		return pshopDao.insertShop(vo);
	}
	
	public PshopVO contentshop(int no) {
		return pshopDao.contentShop(no);
	}
	
	public int deleteShop(int no) {
		return pshopDao.deleteShop(no);
	}
	
	public int updateShop(PshopVO vo) {
		return pshopDao.updateShop(vo);
	}
	
}
