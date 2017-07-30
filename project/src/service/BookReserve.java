package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReserveDao;
import model.Reserve;

public class BookReserve implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		String id = request.getParameter("id");
		String searchkey = request.getParameter("searchKeyword");
		
		Reserve reserve = new Reserve();
		reserve.setBook_id(book_id);
		reserve.setId(id);

		ReserveDao rd = ReserveDao.getInstance();
		int result = rd.insert(reserve);
		
		request.setAttribute("book_id", book_id);
		request.setAttribute("searchKeyword", searchkey);
		request.setAttribute("result", result);
		
		return "bookReserve.jsp";
	}

}
