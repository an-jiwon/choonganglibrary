package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SeatDao;
import model.Seat;

public class AdminSeatList implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		SeatDao sd = SeatDao.getInstance();
		List<Seat> list = sd.list();
		
		request.setAttribute("list", list);
		return "adminSeatList.jsp";
	}

}
