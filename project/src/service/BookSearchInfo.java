package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import dao.CheckOutDao;
import dao.ReserveDao;
import model.Book;
import model.CheckOut;
import model.Reserve;

public class BookSearchInfo implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		int book_id = Integer.parseInt(request.getParameter("book_id"));

		BookDao bd = BookDao.getInstance();
		Book book = bd.bookinfo(book_id);
		book.setYear(book.getBook_public().toString().substring(0,4));
		CheckOutDao cd = CheckOutDao.getInstance();
		CheckOut checkout = cd.checkrs(book_id);
		
		ReserveDao rd = ReserveDao.getInstance();
		Reserve reserve = rd.reservers(book_id);
		
		
		request.setAttribute("checkout", checkout);
		request.setAttribute("reserve", reserve);
		request.setAttribute("book", book);

		
		return "bookSearchInfo.jsp";
	}

}
