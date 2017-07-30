package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.ReplyDao;

public class AdminBoardDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response){
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String category = request.getParameter("category");
		BoardDao bd = BoardDao.getInstance();
		int result = bd.delete(num);
		ReplyDao rd = ReplyDao.getInstance();
		System.out.println(category);

//		int result2 = rd.deleteBoard(num);		
//		
//		request.setAttribute("result2", result2);
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("category", category);
		
		
		return "adminBoardDelete.jsp";
	}

}
