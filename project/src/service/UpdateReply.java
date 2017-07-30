package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;
import model.Reply;

public class UpdateReply implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		int reply_num = Integer.parseInt(request.getParameter("reply_num"));
		String pageNum = request.getParameter("pageNum");
		String main = request.getParameter("re_updateMain");
		Reply reply = new Reply();
		reply.setNum(num);
		reply.setReply_num(reply_num);
		reply.setMain(main);
		ReplyDao rd = ReplyDao.getInstance();	
		int result = rd.update(reply);
		
		request.setAttribute("result", result);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		return "updateReply.jsp";
	}

}
