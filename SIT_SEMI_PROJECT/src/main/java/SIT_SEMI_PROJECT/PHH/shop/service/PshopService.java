package SIT_SEMI_PROJECT.PHH.shop.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import SIT_SEMI_PROJECT.PHH.shop.PreviewVO;
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
	
	public int putCart(PshopVO vo) {
		return pshopDao.putCart(vo);
	}
	
	public List<PshopVO> listCart(int userNo){
		return pshopDao.listCart(userNo);
	}
	
	public int deleteCart(int cartNo) {
		return pshopDao.deleteCart(cartNo);
	}
	
	public int putSell(PshopVO vo) {
		return pshopDao.putSell(vo);
	}
	
	public int sellShop(PshopVO vo) {
		return pshopDao.sellShop(vo);
	}	
	
	public int sellCart(int cartNo) {
		return pshopDao.sellCart(cartNo);
	}
	
	public List<PshopVO> sellList(){
		return pshopDao.sellList();
	}
	
	public List<?> viewReview(int no){
		return pshopDao.viewReview(no);
	}
	
	public int checkSell(int userNo, int no) {
		return pshopDao.checkSell(userNo, no);
	}
	
	public int doReview(PreviewVO vo) {
		return pshopDao.doReview(vo);
	}
	
}
