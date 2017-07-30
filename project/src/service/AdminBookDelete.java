package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;

public class AdminBookDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int book_id = Integer.parseInt(request.getParameter("book_id"));		
		
		BookDao bd = BookDao.getInstance();
		int result = -1;
		
		result = bd.delete(book_id);
		request.setAttribute("result",result);		
		
		
		return "adminBookDelete.jsp";
	}

}
