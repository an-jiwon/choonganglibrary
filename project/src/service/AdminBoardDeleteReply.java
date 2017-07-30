package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;

public class AdminBoardDeleteReply implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		int reply_num = Integer.parseInt(request.getParameter("reply_num"));

		ReplyDao rd = ReplyDao.getInstance();
		int result = rd.delete(num,reply_num);
		
		request.setAttribute("result",result);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		
		
		return "adminBoardDeleteReply.jsp";
	}

}
