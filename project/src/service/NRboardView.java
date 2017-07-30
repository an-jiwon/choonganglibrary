package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NRBoardDao;
import model.NRBoard;

public class NRboardView implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		NRBoardDao nd = NRBoardDao.getInstance();
		nd.readcount(num);
		NRBoard nboard = nd.view(num);
		
		request.setAttribute("num", num);
		request.setAttribute("nboard", nboard);
		request.setAttribute("pageNum", pageNum);
		
		return "viewboard.jsp";
	}

}
