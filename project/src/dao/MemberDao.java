package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;


public class MemberDao {
	private static MemberDao instance; // = new MemberDao();

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("/configuration.xml");
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMapper.openSession(true); // true �� autocommit
			reader.close();
		} catch (IOException e) {
			System.out.println(e.getMessage() + "session");
		}
	}
	public int confirm(String id) {
		int result = 0;
		String str = (String) session.selectOne("memberns.confirm", id);
		if (str != null)
			result = 1;
		return result;
	}

	public int insert(Member member) {
		return session.insert("memberns.insert", member);
	}

	public int check(String id, String passwd) {
		int result = 0;
		String dbPass = (String) session.selectOne("memberns.check",id);
		if(dbPass == null || dbPass.equals("")) {
			result=-1;
		}else if(passwd.equals(dbPass) )
			result=1;
		else
			result=0;
		return result;
	}
	
	
	
/*	------------------------------------------------------------------------------------------------------------*/
	
	public Member select(String id) {

		Member member = (Member) session.selectOne("memberns.select", id);
		return member;
	}

	public int delete(String id) {
		// TODO Auto-generated method stub
		int member = session.delete("memberns.delete", id);
		return member;
	}

	public int update(Member member) {
		int result = session.update("memberns.update", member);
		return result;
	}

	public int adminLoginChk(String id, String passwd) {
		// TODO Auto-generated method stub
		/*System.out.println(id);
		System.out.println(passwd);*/
		int result = 0;
		String dbPass = "";
		if (id == "admin"||id.equals("admin")) {
			try {
				dbPass = (String) session.selectOne("memberns.adminloginChk", id);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			if (dbPass == null || dbPass.equals("")) {
				result = -1;
			} else if (passwd.equals(dbPass))
				result = 1;
			else
				result = 0;
		}else{
			result = -2;
		}
		return result;
	}

	public int getTotal() {
		// TODO Auto-generated method stub
		return (int) session.selectOne("memberns.getTotal");
	}

	public int getTotal(String idsearch) {
		// TODO Auto-generated method stub
		return (int) session.selectOne("memberns.getTotalsearch",idsearch);
	}

	public List<MemberDao> listsearch(String idsearch, int startRow, int endRow) {
		// TODO Auto-generated method stub
		HashMap hm = new HashMap<>();
		
		hm.put("idsearch", idsearch);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		
		return session.selectList("memberns.listsearch",hm);
	}

	public List<MemberDao> list(int startRow, int endRow) {
		// TODO Auto-generated method stub
		HashMap<String,Integer> hm = new HashMap<>();
		
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		
		return session.selectList("memberns.list",hm);
	}

	public List<Member> maillist() {
		// TODO Auto-generated method stub
		return session.selectList("memberns.maillist");
	}
	
/*	----------------------------------------------------------------------------------------------------*/
	
	public Member findId(String name, String phone) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("name", name);
		hm.put("phone", phone);
		return (Member) session.selectOne("memberns.findid",hm);
	}
	
	public Member findPass(String name, String phone, String id) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("name", name);
		hm.put("phone", phone);
		hm.put("id", id);
		return (Member) session.selectOne("memberns.findpass", hm);
	}
}
