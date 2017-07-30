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
import model.NRBoard;

public class NRBoardDao { 
	private static NRBoardDao instance;
	private NRBoardDao() {	}
	public static NRBoardDao getInstance() {
		if (instance == null) instance = new NRBoardDao();
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
	
	public int insert(NRBoard nrboard) {
		return session.insert("nrboardns.insert",nrboard);
	}
	
	public int getNum() {
		return (int) session.selectOne("nrboardns.getNum");
	}
	public int getTotal() {
		return (int)session.selectOne("nrboardns.getTotal");
	}
	
	public List<NRBoard> list(int startRow, int endRow) {
		HashMap<String, Integer> hashMap = new HashMap<>();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		return (List<NRBoard>)session.selectList("nrboardns.list",hashMap);
	}
	
	
	public int readcount(int num) {
		return session.update("nrboardns.readcount",num);
	}
	
	
	public NRBoard view(int num) {
		return (NRBoard) session.selectOne("nrboardns.view",num);
	}
	
	
	public int delete(int num) {
		return session.delete("nrboardns.delete",num);
	}
	
	
	public int modify(NRBoard nboard) {
		int result=0;
		try {
			result = session.update("nrboardns.modify",nboard);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
			return result;
	}
	
	public int filedelete(int num, String NRBoard_file) {
		HashMap hm = new HashMap();
		hm.put("num", num);
		hm.put("NRBoard_file", NRBoard_file);
		return session.update("nrboardns.filedelete",hm);
	}
	public NRBoard download(int num) {
		// TODO Auto-generated method stub
		return (NRBoard) session.selectOne("nrboardns.download",num);
	}
	
	
	
}