package service;

import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyseatDao;
import dao.SeatDao;
import model.Myseat;
import model.Seat;

public class CheckIn implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int seatnum = Integer.parseInt(request.getParameter("seatnum"));
		String id = request.getParameter("id");
		SeatDao sd = SeatDao.getInstance();
		MyseatDao msd = MyseatDao.getInstance();
		int result = sd.checkIn(id,seatnum);
		int myresult = msd.checkIn(id,seatnum);
		Seat seat = sd.list(seatnum);
		
		if(seat.getSeatCheck() != "y"){
		Timer timer = new Timer();
		TimerTask tt = new TimerTask() {

			@Override
			public void run() {
				int result2 = sd.checkOut(seatnum);
				int myresult2 = msd.seatUpdate(id,seatnum);
			}
			
		};
		
		timer.schedule(tt, 7200000);
		}
		request.setAttribute("result", result);
		return "checkIn.jsp";
	}

}
