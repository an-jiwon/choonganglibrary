package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import dao.CheckOutDao;
import model.Book;

public class BookCheckIn implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		String state = request.getParameter("state");
		String searchkey = request.getParameter("searchKeyword");
		
		CheckOutDao cd = CheckOutDao.getInstance();
		int checkrs = cd.update(book_id);
		
		Book book = new Book();
		book.setBook_id(book_id);
		BookDao bd = BookDao.getInstance();
		int bookrs = bd.update(book_id);
		
		request.setAttribute("book_id", book_id);
		request.setAttribute("searchKeyword", searchkey);
		request.setAttribute("checkrs", checkrs);
		request.setAttribute("bookrs", bookrs);
		
		return "bookCheckIn.jsp";
	}

}
