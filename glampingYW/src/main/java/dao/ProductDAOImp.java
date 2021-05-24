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
	
	// 상품등록신청
	@Override
	public void proinsertdo(Product pro) throws Exception {
		System.out.println("ProductDAOImp까지도착");
		System.out.println("파일이름 :" + pro.getPro_pic());
		System.out.println("편의시설 :" + pro.getPro_con());
		sqlsession.insert("products.proinsertdo", pro);
		
	}

}
