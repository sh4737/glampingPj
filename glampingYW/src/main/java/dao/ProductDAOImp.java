package dao;

import model.Product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import model.Room;
import model.RPhoto;
import model.Seller;
import model.Reservation;

@Repository
public class ProductDAOImp implements ProductDAO{

	@Autowired
	private SqlSession sqlsession;
	
	// product 상품등록신청
	@Override
	public int proinsertdo(Product pro) throws Exception {
		return sqlsession.insert("products.proinsertdo", pro);		
	}
	
	// product 등록시점 pro_no 구하기
	@Override
	public Product proload(String sel_id) throws Exception {	
		return (Product) sqlsession.selectOne("products.proload", sel_id);
	}

}
