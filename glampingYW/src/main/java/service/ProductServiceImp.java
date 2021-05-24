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

	// 상품등록신청
	@Override
	public void proinsertdo(Product pro) throws Exception {
		proDao.proinsertdo(pro);
	}
	




}
