package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SeatDao;
import model.Seat;

public class SeatList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		SeatDao sd = SeatDao.getInstance();
		List<Seat> list = sd.list();
		/*System.out.println(id);*/
		if(id == null || id.equals("")) {
			request.setAttribute("list", list);
		}else {
			Seat idlist = sd.idlist(id);
			request.setAttribute("list", list);
			request.setAttribute("idlist", idlist);
		}
		return "seatList.jsp";
	}

}
