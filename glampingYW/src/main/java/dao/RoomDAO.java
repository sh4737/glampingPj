package dao;

import java.util.List;


import model.RPhoto;
import model.Room;

public interface RoomDAO {
	
	public int rminsertdo(Room rm) throws Exception;
	
	public Room rmload(int pro_no) throws Exception;
	
	public int rpinsertdo(RPhoto rp) throws Exception;
	
	public List<Room> getrmlist(int pro_no) throws Exception;
	
	public Room getlowpri(int pro_no) throws Exception;
	



}
