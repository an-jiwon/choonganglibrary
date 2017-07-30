package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NRBoardDao;
import model.NRBoard;

public class NRboardModifyForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		int num = Integer.parseInt(request.getParameter("num"));
		
		NRBoardDao nd = NRBoardDao.getInstance();
		NRBoard nboard = nd.view(num);
		
		request.setAttribute("nboard", nboard);
		
		return "modifyForm.jsp";
	}

}
