package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.sql.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import model.Member;
import model.Seat;

import javax.naming.*;

public class SeatDao { 
	private static SeatDao instance;
	private SeatDao() {	}
	public static SeatDao getInstance() {
		if (instance == null) instance = new SeatDao();
		return instance;
	}

	
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader); 
			session = sqlMapper.openSession(true); 
			reader.close();
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
	public List<Seat> list() {
		// TODO Auto-generated method stub
		return session.selectList("seatns.list");
	}
	public int checkIn(String id, int seatnum) {
		HashMap hashMap = new HashMap<>();
		hashMap.put("id", id);
		hashMap.put("seatnum", seatnum);
		return session.update("seatns.checkIn",hashMap);
	}
	public int checkOut(int seatnum) {
		// TODO Auto-generated method stub
		return session.update("seatns.checkOut",seatnum);
	}
	public String checkOutid(int seatnum) {
		// TODO Auto-generated method stub
		return (String) session.selectOne("seatns.checkOutid",seatnum);
	}
	public Seat list(int seatnum) {
		// TODO Auto-generated method stub
		return (Seat) session.selectOne("seatns.list2",seatnum);
	}
	public Seat idlist(String id) {
		// TODO Auto-generated method stub
		return (Seat) session.selectOne("seatns.idlist",id);
	}
}