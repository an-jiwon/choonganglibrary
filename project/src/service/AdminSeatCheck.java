package service;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyseatDao;
import model.Myseat;

public class AdminSeatCheck implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int seatnum = Integer.parseInt(request.getParameter("seatnum"));
	
		MyseatDao bd = MyseatDao.getInstance(); 
		List<Myseat> list = bd.list(seatnum);
		

		request.setAttribute("seatnum", seatnum);
		request.setAttribute("list", list);
		return "adminSeatCheck.jsp";
	}

}
