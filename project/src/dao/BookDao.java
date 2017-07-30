package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import javax.sql.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Book;
import model.Member;
import javax.naming.*;

public class BookDao { 
	private static BookDao instance;
	private BookDao() {	}
	public static BookDao getInstance() {
		if (instance == null) instance = new BookDao();
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

	

	public List<Book> list(String searchKeyword, String category, int startRow, int endRow) {
		HashMap hm = new HashMap();
		hm.put("searchKeyword", searchKeyword);
		hm.put("category", category);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		
		List<Book> list = null;
		if (category != null && category.equals("전체")){
			try {
				list = session.selectList("bookns.list2",hm);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
		try {
			list = session.selectList("bookns.list",hm);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			}
		}
		return list;
	}
	
	
	
	public int getTotal(String searchKeyword, String category) {
		HashMap<String,String> hm = new HashMap<>();
		hm.put("searchKeyword", searchKeyword);
		hm.put("category", category);
		if (category != null && category.equals("전체")){
				return (int) session.selectOne("bookns.getTotal2",hm);
		} else {
			return (int) session.selectOne("bookns.getTotal",hm);
		}	
	}
	
	
	public Book bookinfo(int book_id) {
		return (Book) session.selectOne("bookns.select",book_id);
	}
	
	public int modify(Book book) {
		return session.update("bookns.modify",book);
	}
	
	public int update(int book_id) {
		return session.update("bookns.modify2",book_id);
	}
	
	
/*	--------------------------------------------------------------------------------------------------------------*/
	public int insert(Book book) {

		int result = 0;
		try {
			System.out.println("1");
			result = session.insert("bookns.insert", book);

			System.out.println("2");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public Book select(int book_id) {
		return (Book) session.selectOne("bookns.select", book_id);
	}

	public int update(Book book) {
		// TODO Auto-generated method stub
		return session.update("bookns.update", book);
	}

	public int delete(int book_id) {
		int book = session.delete("bookns.delete", book_id);
		return book;
	}

	public List<BookDao> listAdmin(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();

		hm.put("startRow", startRow);
		hm.put("endRow", endRow);

		return session.selectList("bookns.listadmin", hm);
	}

	public List<BookDao> listsearch(String category, String titlemin, int startRow, int endRow) {
		HashMap hm = new HashMap<>();

		hm.put("category", category);
		hm.put("titlemin", titlemin);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);

		return session.selectList("bookns.listsearch", hm);
	}

	public List<BookDao> listsearch2(String titlemin, int startRow, int endRow) {
		HashMap hm = new HashMap<>();

		hm.put("titlemin", titlemin);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);

		return session.selectList("bookns.listsearch2", hm);
	}

	public int getTotal2() {
		return (int) session.selectOne("bookns.bookgetTotal");
	}

	public int getTotalsearch(String titlemin) {

		return (int) session.selectOne("bookgetTotalsearch2", titlemin);
	}

	public int getTotalsearch(String category, String titlemin) {
		HashMap<String, String> hm = new HashMap<>();

		hm.put("category", category);
		hm.put("titlemin", titlemin);

		return (int) session.selectOne("bookgetTotalsearch2", hm);
	}

}