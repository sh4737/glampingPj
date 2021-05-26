package dao;

import model.Product;
import model.PPhoto;
import model.Room;
import model.RPhoto;
import model.Seller;
import model.Reservation;

public interface ProductDAO {
	
	public int proinsertdo(Product pro) throws Exception;
	
	public Product proload(String sel_id) throws Exception;
}
