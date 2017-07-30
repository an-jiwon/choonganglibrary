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
import model.Reserve;

import javax.naming.*;

public class ReserveDao { 
	private static ReserveDao instance;
	private ReserveDao() {	}
	public static ReserveDao getInstance() {
		if (instance == null) instance = new ReserveDao();
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
	
	public int insert(Reserve reserve) {
		return session.insert("reservens.insert", reserve);
	}
	
	
	public Reserve reservers(int book_id) {
		return (Reserve) session.selectOne("reservens.select",book_id);
	}
/*	-----------------------------------------------------------------------------------*/
	public List<Reserve> list(String id, int startRow, int endRow) {
		HashMap list = new HashMap<>();

		list.put("startRow", startRow);
		list.put("endRow", endRow);
		list.put("id", id);
		
		return session.selectList("reservens.list", list);
	}
	
	public int getTotal(String id) {
		
		return (int) session.selectOne("reservegetTotal",id);
	}
	public int cancel(Reserve reserve) {
		// TODO Auto-generated method stub
		return session.delete("reservens.cancel", reserve);
	}


}