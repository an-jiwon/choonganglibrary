package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookLogout implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int book_id = Integer.parseInt(request.getParameter("book_id"));

		
		request.setAttribute("book_id", book_id);

		
		return "bookLogout.jsp";
	}

}
