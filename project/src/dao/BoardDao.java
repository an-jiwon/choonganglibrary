package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board;



public class BoardDao { 
	private static BoardDao instance;
	private BoardDao() {	}
	public static BoardDao getInstance() {
		if (instance == null) instance = new BoardDao();
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
	public List<Board> list(String category, int startRow,int endRow) {
		HashMap hashMap = new HashMap();
		hashMap.put("category", category);
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		if(category.equals("notice")) {
			return session.selectList("boardns.list1", hashMap);
		}else {
			return session.selectList("boardns.list2", hashMap);
		}
	}
	public List<Board> list(int startRow,int endRow) {
		HashMap hashMap = new HashMap();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		
		return session.selectList("boardns.list2", hashMap);
	}
	public int getTotal(String keyword) {
		if(keyword == null || keyword.equals(""))
			return (int) session.selectOne("boardns.getTotal1");
		else
			return (int) session.selectOne("boardns.getTotal3",keyword);
	
	}
	public int getTotal2(String keyword) {
		if(keyword == null || keyword.equals(""))
			return (int) session.selectOne("boardns.getTotal2");
		else
			return (int) session.selectOne("boardns.getTotal4",keyword);
	}
	
	public Board select(int num) {
		Board board = null;
		try {
			board = (Board)session.selectOne("boardns.select",num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return board;
	}
	public int view(int num) {
		return session.update("boardns.view",num);
		
	}
	public int getNum() {
		
		return (int) session.selectOne("boardns.getNum");
	}
	public int insert(Board board) {
		/*System.out.println(board.getNum());
		System.out.println(board.getTitle());
		System.out.println(board.getWriter());
		System.out.println(board.getCategory());
		System.out.println(board.getBoard_main());
		System.out.println(board.getBoard_file());*/
		return session.insert("boardns.insert", board);
	}
	public int update(Board board) {
		/*System.out.println(board.getNum());

		System.out.println(board.getTitle());
		System.out.println(board.getCategory());
		System.out.println(board.getBoard_main());
		System.out.println(board.getBoard_file());*/
		int result=0;
		result = session.update("boardns.update",board);
		return result;
	}
	public int delete(int num) {
		// TODO Auto-generated method stub
		return session.delete("boardns.delete",num);
	}
	public List<Board> search(int startRow, int endRow, String keyword) {
		HashMap hashMap = new HashMap();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		hashMap.put("keyword", keyword);
		/*System.out.println(keyword);*/
		return session.selectList("boardns.search",hashMap);
	}
	
	public List<Board> search2(int startRow, int endRow, String keyword) {
		HashMap hashMap = new HashMap();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		hashMap.put("keyword", keyword);
		/*System.out.println(keyword);*/
		return session.selectList("boardns.search2",hashMap);
	}
	public Board download(int num) {
		// TODO Auto-generated method stub
		return (Board) session.selectOne("boardns.download",num);
	}
	
	
/*	-------------------------------------------------------------------------------------------------------*/
	
	public List<Board> mylist(String id, int startRow, int endRow) {
		HashMap hashMap = new HashMap();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		hashMap.put("id", id);		
		
		return session.selectList("boardns.mylist", hashMap);
	}

	
	public int updateNotice(Board board) {
		/*System.out.println(board.getNum());

		System.out.println(board.getTitle());
		System.out.println(board.getCategory());
		System.out.println(board.getBoard_main());
		System.out.println(board.getBoard_file());*/
		int result=0;
		result = session.update("boardns.updateNotice",board);
		return result;
	}
	public int getTotal0(String id) {
		// TODO Auto-generated method stub
		return (int) session.selectOne("boardns.getTotal0",id);
	}
}