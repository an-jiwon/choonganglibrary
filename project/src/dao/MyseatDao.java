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
import model.Myseat;


import javax.naming.*;

public class MyseatDao { 
	private static MyseatDao instance;
	private MyseatDao() {	}
	public static MyseatDao getInstance() {
		if (instance == null) instance = new MyseatDao();
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
	public List<Myseat> list(String id, int startRow, int endRow) {
		HashMap list = new HashMap<>();

		list.put("startRow", startRow);
		list.put("endRow", endRow);
		list.put("id", id);
		
		return  session.selectList("myseatns.list", list);
	}
	public int getTotal(String id) {
		return (int) session.selectOne("myseatns.myseatgetTotal",id);
	}

	public int seatUpdate(Myseat myseat) {
		// TODO Auto-generated method stub		
		return session.update("myseatns.seatupdate", myseat);
	}
	
	public int checkIn(String id, int seatnum) {
		HashMap hashmap = new HashMap<>();
		hashmap.put("id", id);
		hashmap.put("seatnum", seatnum);
		// TODO Auto-generated method stub
		return session.insert("myseatns.checkIn", hashmap);
	}
	
	public List<Myseat> list(int seatnum) {
		// TODO Auto-generated method stub
		return session.selectList("myseatns.listseatcheck", seatnum);
	}
	public int checkout(String id, int seatnum) {
		// TODO Auto-generated method stub
		HashMap list = new HashMap<>();

		list.put("id", id);
		list.put("seatnum", seatnum);
		
		return session.update("myseatns.mycheckout",list);
	}
	public int seatUpdate(String id, int seatnum) {
		HashMap hashmap = new HashMap<>();
		hashmap.put("id", id);
		hashmap.put("seatnum", seatnum);
		return session.update("myseatns.checkOut",hashmap);
	}
	
}