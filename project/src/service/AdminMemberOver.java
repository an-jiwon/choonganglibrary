package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CheckOutDao;
import model.CheckOut;

public class AdminMemberOver implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response){
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
		final int ROWPERPAGE = 5;
		final int PAGEPERBLOCK = 5;
		String pageNum = request.getParameter("pageNum");
		
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
	
		int currentPage = Integer.parseInt(pageNum);
		
		CheckOutDao rd = CheckOutDao.getInstance();
		
		
		int startRow = (currentPage - 1) * ROWPERPAGE + 1;
		
		int endRow = startRow + ROWPERPAGE - 1;
		
		if (id == null || id.equals("")){		
			int total = rd.overgetTotalall();
			List<CheckOut> list = rd.over(startRow, endRow);
			
			
			int totPage = (int) Math.ceil((double) total / ROWPERPAGE);
			int startPage = currentPage - (currentPage - 1) % PAGEPERBLOCK;
			int endPage = startPage + PAGEPERBLOCK - 1;
			if (endPage > totPage)
				endPage = totPage;
			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("PAGEPERBLOCK", PAGEPERBLOCK);
			request.setAttribute("list", list);
			request.setAttribute("totPage", totPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("id", id);
			
			return "adminMemberOver.jsp";
			
		}
		else{
			
			int total = rd.overgetTotal(id);
			List<CheckOut> list = rd.over(id,startRow, endRow);
			
			int totPage = (int) Math.ceil((double) total / ROWPERPAGE);
			int startPage = currentPage - (currentPage - 1) % PAGEPERBLOCK;
			int endPage = startPage + PAGEPERBLOCK - 1;
			if (endPage > totPage)
				endPage = totPage;
			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("PAGEPERBLOCK", PAGEPERBLOCK);
			request.setAttribute("list", list);
			request.setAttribute("totPage", totPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("id", id);
		
			return "adminMemberOver.jsp";
		}
		
		
	
	}

}
