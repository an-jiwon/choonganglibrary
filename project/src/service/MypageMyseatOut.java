package service;

import java.util.Date;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyseatDao;
import dao.SeatDao;
import model.Member;
import model.Myseat;

public class MypageMyseatOut implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		int seatnum = Integer.parseInt(request.getParameter("seatnum"));
	
		
		Myseat myseat = new Myseat();
		
		myseat.setId(id);
		myseat.setSeatnum(seatnum);
		
		MyseatDao my = MyseatDao.getInstance();
		SeatDao se = SeatDao.getInstance();
		
		int result = my.seatUpdate(myseat);
		int result2 = se.checkOut(seatnum);
		
		request.setAttribute("result", result);
		return "seatOut.jsp";
		
	}

}
