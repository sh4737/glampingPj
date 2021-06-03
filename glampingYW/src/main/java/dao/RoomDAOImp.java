package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import model.RPhoto;
import model.Room;

@Repository
public class RoomDAOImp implements RoomDAO{

	@Autowired
	private SqlSession sqlsession;
	
	// room 상품등록신청
	@Override
	public int rminsertdo(Room rm) throws Exception {

		return sqlsession.insert("rooms.rminsertdo", rm);
	}

	// room 등록시점 rm_no 구하기
	@Override
	public Room rmload(int pro_no) throws Exception {

		return (Room) sqlsession.selectOne("rooms.rmload", pro_no);
	}

	// rphoto 상품등록신청
	@Override
	public int rpinsertdo(RPhoto rp) throws Exception {

		return sqlsession.insert("rphotos.rpinsertdo", rp);
	}

	// room 목록구하기
	@Override
	public List<Room> getrmlist(int pro_no) throws Exception {

		List<Room> rmlist = sqlsession.selectList("rooms.getrmlist", pro_no);
		return rmlist;
	}

	// product 중 젤 싼방 값구하기
	@Override
	public Room getlowpri(int pro_no) throws Exception {
		// TODO Auto-generated method stub
		return (Room) sqlsession.selectOne("rooms.getlowpri", pro_no);
	}
	



	
}
