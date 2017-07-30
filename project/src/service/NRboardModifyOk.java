package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NRBoardDao;
import model.NRBoard;

public class NRboardModifyOk implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String NRBoard_file = request.getParameter("NRBoard_file");
		String main = request.getParameter("main");
		String category = request.getParameter("category");
		
		NRBoard nboard = new NRBoard();
		nboard.setNum(num);
		nboard.setTitle(title);
		nboard.setNRBoard_file(NRBoard_file);
		nboard.setMain(main);
		nboard.setCategory(category);
		
		/*System.out.println(num);
		System.out.println(title);
		System.out.println(NRBoard_file);
		System.out.println(main);
		System.out.println(category);*/
		
		NRBoardDao nd = NRBoardDao.getInstance();
		int result = nd.modify(nboard);
		
		request.setAttribute("result", result);
		request.setAttribute("num", num);
		
		return "modifyOk.jsp";
	}

}
