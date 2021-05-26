package service;

import model.Product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ProductDAOImp;
import model.PPhoto;
import model.Room;
import model.RPhoto;
import model.Seller;
import model.Reservation;

@Service
public class ProductServiceImp implements ProductService{

	@Autowired 
	private ProductDAOImp proDao;

	// product 상품등록신청
	@Override
	public int proinsertdo(Product pro) throws Exception {
		return proDao.proinsertdo(pro);
	}
	
	// product 등록시점 pro_no 구하기
	@Override
	public Product proload(String sel_id) throws Exception {
		
		return proDao.proload(sel_id);
	}
	




}
