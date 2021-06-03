package service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.RoomDAOImp;
import model.RPhoto;
import model.Room;



@Service
public class RoomServiceImp implements RoomService{

	@Autowired
	private RoomDAOImp rmDao;
	
	@Override
	public int rminsertdo(Room rm) throws Exception {
		
		return rmDao.rminsertdo(rm);
	}

	@Override
	public Room rmload(int pro_no) throws Exception {

		return rmDao.rmload(pro_no);
	}

	@Override
	public int rpinsertdo(RPhoto rp) throws Exception {
		
		return rmDao.rpinsertdo(rp);
	}

	@Override
	public List getrmlist(int pro_no) throws Exception {

		return rmDao.getrmlist(pro_no);
	}

	@Override
	public Room getlowpri(int pro_no) throws Exception {
		// TODO Auto-generated method stub
		return rmDao.getlowpri(pro_no);
	}






	




}
