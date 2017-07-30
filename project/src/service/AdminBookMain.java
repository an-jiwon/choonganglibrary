package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import dao.CheckOutDao;
import model.CheckOut;

public class AdminBookMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response){

		String category = request.getParameter("category");
		String titlemin = request.getParameter("titlemin");

		final int ROWPERPAGE = 5;
		final int PAGEPERBLOCK = 5;

		String pageNum = request.getParameter("pageNum");

		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";

		int currentPage = Integer.parseInt(pageNum);

		BookDao bd = BookDao.getInstance();

		int total = bd.getTotal2();
		int startRow = (currentPage - 1) * ROWPERPAGE + 1;

		int endRow = startRow + ROWPERPAGE - 1;

		if (titlemin == null || titlemin.equals("")) {
			List<BookDao> list = bd.listAdmin(startRow, endRow);

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

			if (category == "전체" || category.equals("전체")) {
				
				category = "";
				total = bd.getTotalsearch(titlemin);
				List<BookDao> list = bd.listsearch2(titlemin, startRow, endRow);
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
			else {
				total = bd.getTotalsearch(category, titlemin);
				List<BookDao> list = bd.listsearch(category, titlemin, startRow, endRow);

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
			
			request.setAttribute("category", category);
			request.setAttribute("titlemin", titlemin);
		}
		return "adminBookMain.jsp";
	}

}
