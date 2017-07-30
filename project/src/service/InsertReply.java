package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;
import model.Reply;

public class InsertReply implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String main = request.getParameter("inputReply");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String writer = request.getParameter("writer");
		ReplyDao rd = ReplyDao.getInstance();
		int reply_num = rd.getReNum(num);
		
/*		System.out.println(main);
		System.out.println(num);
		System.out.println(reply_num);
		System.out.println(writer);*/
		
		Reply reply = new Reply();
		reply.setNum(num);
		reply.setReply_num(reply_num);
		reply.setMain(main);
		reply.setWriter(writer);
		
		int result = rd.insert(reply);
			
		
		request.setAttribute("result", result);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		
		return "content.do";
	}

}
