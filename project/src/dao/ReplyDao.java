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
import model.Reply;

import javax.naming.*;

public class ReplyDao { 
	private static ReplyDao instance;
	private ReplyDao() {	}
	public static ReplyDao getInstance() {
		if (instance == null) instance = new ReplyDao();
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
	public List<Reply> select(int num) {
		// TODO Auto-generated method stub
		return  session.selectList("replyns.select",num);
	}

	public int getReNum(int num) {
		// TODO Auto-generated method stub
		return (int) session.selectOne("replyns.getReNum",num);
	}
	public int insert(Reply reply) {
		/*System.out.println(reply.getNum());
		System.out.println(reply.getReply_num());
		System.out.println(reply.getMain());
		System.out.println(reply.getWriter());*/
		return session.insert("replyns.insert", reply);
	}
	public int delete(int num, int reply_num) {
		HashMap hashMap = new HashMap<>();
		hashMap.put("num", num);
		hashMap.put("reply_num", reply_num);
		return session.delete("replyns.delete",hashMap);
	}
	public int update(Reply reply) {
		int result=0;
		result = session.update("replyns.update",reply);
		return result;
	}
	public int deleteBoard(int num) {
		// TODO Auto-generated method stub
		return session.delete("replyns.deleteBoard",num);
	}

}