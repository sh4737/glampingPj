package service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.product.ProductDao;
import model.Product;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao pd;
	
	public int getTotal(Product product) {
		return pd.getTotal(product);
	}
	
	public List<Product> listTop(Product product) {
		return pd.listTop(product);
	}
	
	public List<Product> listBest(Product product) {
		return pd.listBest(product);
	}
	
	public List<Product> list(Product product) {
		
		// 키워드 null 처리
		if("".equals(product.getKeyword())) {
			product.setKeyword(null);
		}
		
		// 지역 검색어 변환
		if ("Gyeonggi".equals(product.getRegion())) {
			product.setRegion("경기");
		} else if ("Incheon".equals(product.getRegion())) {
			product.setRegion("인천");
		} else if ("Chung".equals(product.getRegion())) {
			product.setRegion("충청");
		} else if ("Gyeongsang".equals(product.getRegion())) {
			product.setRegion("경상");
		} else if ("Busan".equals(product.getRegion())) {
			product.setRegion("부산");
		} else if ("Jeol".equals(product.getRegion())) {
			product.setRegion("전라");
		} else if ("Jeju".equals(product.getRegion())) {
			product.setRegion("제주");
		} else if ("Gangwon".equals(product.getRegion())) {
			product.setRegion("강원");
		}
		
		System.out.println("Region : " + product.getRegion());
		
		return pd.list(product);
	}
	
	public Product proview(int pro_no) {
		return pd.proview(pro_no);
	}
	
	
}
