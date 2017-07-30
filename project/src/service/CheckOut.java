package service;

import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.MyseatDao;
import dao.SeatDao;
import model.Seat;

public class CheckOut implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int seatnum = Integer.parseInt(request.getParameter("seatnum"));
		String id = request.getParameter("id");
		SeatDao sd = SeatDao.getInstance();
		MyseatDao msd = MyseatDao.getInstance();
		int result = sd.checkOut(seatnum);
		int myresult2 = msd.seatUpdate(id,seatnum);
		
		request.setAttribute("result", result);
		return "checkOut.jsp";
	}

}
