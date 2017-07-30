package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyseatDao;
import dao.SeatDao;
import model.Myseat;
import model.Seat;

public class AdminSeatOut implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int seatnum = Integer.parseInt(request.getParameter("seatnum"));
				
		SeatDao sd =SeatDao.getInstance();
		String id = sd.checkOutid(seatnum);		
		
		MyseatDao md = MyseatDao.getInstance();
		int result = md.checkout(id,seatnum);
		
		int result2=sd.checkOut(seatnum);
		
		
		request.setAttribute("result2", result2);
		request.setAttribute("result", result);
		
		return "adminseatout.jsp";
	}

}
