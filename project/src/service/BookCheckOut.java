package service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import dao.CheckOutDao;
import model.Book;
import model.CheckOut;

public class BookCheckOut implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		String id = request.getParameter("id");
		String searchkey = request.getParameter("searchKeyword");
		String state = request.getParameter("state");
		
		CheckOut checkout = new CheckOut();
		checkout.setBook_id(book_id);
		checkout.setId(id);

		CheckOutDao cd = CheckOutDao.getInstance();
		int result = cd.insert(checkout);
		
		Book book = new Book();
		book.setState(state);
		book.setBook_id(book_id);
		BookDao bd = BookDao.getInstance();
		int bookrs = bd.modify(book);
		
		request.setAttribute("bookrs", bookrs);
		request.setAttribute("book_id", book_id);
		request.setAttribute("searchKeyword", searchkey);
		request.setAttribute("result", result);
		
		return "bookCheckOut.jsp";
	}

}
