package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NRBoardDao;

public class NRboardDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		int num = Integer.parseInt(request.getParameter("num"));
		
		NRBoardDao nd = NRBoardDao.getInstance();
		int result = nd.delete(num);
		
		request.setAttribute("result", result);
		
		return "deleteOK.jsp";
	}

}
