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

import model.CheckOut;
import model.Member;
import service.BookCheckOut;

import javax.naming.*;

public class CheckOutDao { 
	private static CheckOutDao instance;
	private CheckOutDao() {	}
	public static CheckOutDao getInstance() {
		if (instance == null) instance = new CheckOutDao();
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
	
	
	public int insert(CheckOut checkout) {
		return session.insert("checkns.insert",checkout);
	}
	
	
	public CheckOut checkrs(int book_id) {
		return (CheckOut) session.selectOne("checkns.select",book_id);
	}
	
	public int update(int book_id) {
		return session.update("checkns.update",book_id);
	}
	
	
/*-------------------------------------------------------------------------------------------------------------------*/	
	
	
	
public List<CheckOut> list(String id, int startRow, int endRow) {
		
		HashMap list = new HashMap<>();
		
		list.put("startRow", startRow);
		list.put("endRow", endRow);
		list.put("id", id);
		
		return session.selectList("checkns.list",list);
		
	}
	public int getTotal(String id) {
		return (int) session.selectOne("checkns.checkoutgetTotal",id);
	}
	

	public List<CheckOut> over(String id, int startRow, int endRow) {
		// TODO Auto-generated method stub
		HashMap list = new HashMap<>();
		
		list.put("startRow", startRow);
		list.put("endRow", endRow);
		list.put("id", id);
		
		return session.selectList("checkns.over",list);
	}
	
	public int mycheckgetTotal(String id) {
		return (int) session.selectOne("checkns.mycheckgetTotal",id);
	}
	
	public List<CheckOut> over(int startRow, int endRow) {
		HashMap list = new HashMap<>();
		
		list.put("startRow", startRow);
		list.put("endRow", endRow);
	
		
		return session.selectList("checkns.overadmin",list);
	}
	public int overgetTotalall() {
		// TODO Auto-generated method stub
		return (int) session.selectOne("checkns.checkoutgetTotalall");
	}
	public int overgetTotal(String id) {
		// TODO Auto-generated method stub
		return (int) session.selectOne("checkns.checkoutgetTotalid",id);
	}
}