package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.ReplyDao;
import model.Board;
import model.Reply;

public class AdminBoardDeleteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		//String category = request.getParameter("category");
		BoardDao bd = BoardDao.getInstance();
		bd.view(num);
		Board board = bd.select(num);
		ReplyDao rd = ReplyDao.getInstance();
		List<Reply> reply = rd.select(num);
		
		/*System.out.println(num);
		System.out.println(reply);*/
		
		request.setAttribute("board",board);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("reply", reply);
		/*if(category.equals("notice"))
		return "noticeContent.jsp";
	else
		return "freeContent.jsp";*/
		return "adminBoardDeleteForm.jsp";
	}

}
