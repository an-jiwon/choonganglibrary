package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import model.Book;

public class AdminBookUpdateForm implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		String pageNum = request.getParameter("pageNum");
		BookDao bd = BookDao.getInstance();
		Book book = bd.select(book_id);
		
		request.setAttribute("book", book);
		request.setAttribute("pageNum", pageNum);
		return "adminBookUpdateForm.jsp";
	}

}


