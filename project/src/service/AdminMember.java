package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class AdminMember implements CommandProcess {
 
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");

		final int ROWPERPAGE = 10;
		final int PAGEPERBLOCK = 10;

		String pageNum = request.getParameter("pageNum");

		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";

		int currentPage = Integer.parseInt(pageNum);

		MemberDao bd = MemberDao.getInstance();

		int total = bd.getTotal();
		int startRow = (currentPage - 1) * ROWPERPAGE + 1;

		int endRow = startRow + ROWPERPAGE - 1;

		if (id == null || id.equals("")) {
			
			List<MemberDao> list = bd.list(startRow, endRow);

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

		} else {
				
				total =  bd.getTotal(id);
				
				List<MemberDao> list = bd.listsearch(id,startRow, endRow);
				
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
			}
			
			request.setAttribute("id", id);
			
		
		
		
		return "adminMemberMain.jsp";
	}
}

