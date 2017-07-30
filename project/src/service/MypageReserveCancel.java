package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReserveDao;
import model.Reserve;

public class MypageReserveCancel implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");		
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		
		Reserve reserve = new Reserve();
		
		reserve.setBook_id(book_id);
		reserve.setId(id);
	 
		ReserveDao rd = ReserveDao.getInstance();
		
		int result = rd.cancel(reserve);
		request.setAttribute("result", result);
		return "reserveCancel.jsp";
	}

}
