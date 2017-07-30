package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NRBoardDao;
import model.NRBoard;

public class NRboardList implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		NRBoardDao bd = NRBoardDao.getInstance();
	
		final int ROWPERPAGE = 5;
		final int PAGEPERBLOCK = 5;
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		
		int total = bd.getTotal();
		int startRow = (currentPage - 1) * ROWPERPAGE + 1;
		int endRow = startRow + ROWPERPAGE - 1;
		
		List<NRBoard> list = bd.list(startRow,endRow);
		
		int count = (Integer.parseInt(pageNum)-1)*ROWPERPAGE;
		
		int totPage = (int)Math.ceil((double)total/ROWPERPAGE);
		int startPage = currentPage - (currentPage - 1)%PAGEPERBLOCK;
		int endPage = startPage + PAGEPERBLOCK - 1;
		if (endPage > totPage) 
			endPage = totPage;
		
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("PAGEPERBLOCK", PAGEPERBLOCK);
		request.setAttribute("totPage", totPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
	
		return "list.jsp";
	}

}
