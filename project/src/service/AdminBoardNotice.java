package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;

public class AdminBoardNotice implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response){
		final int ROWPERPAGE = 5;
		final int PAGEPERBLOCK = 5;
		String category = "notice";
		String pageNum = request.getParameter("pageNum");
		String keyword = request.getParameter("keyword");

		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		BoardDao bd = BoardDao.getInstance();
		int total = bd.getTotal(keyword);
		int startRow = (currentPage - 1) * ROWPERPAGE + 1;
		int endRow = startRow + ROWPERPAGE - 1;
		int cnt = (Integer.parseInt(pageNum) - 1) * ROWPERPAGE;

		int totPage = (int) Math.ceil((double) total / ROWPERPAGE);
		int startPage = currentPage / 5 * PAGEPERBLOCK + 1;
		int endPage = startPage + PAGEPERBLOCK - 1;
		if (endPage > totPage)
			endPage = totPage;

		request.setAttribute("cnt", cnt);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("PAGEPERBLOCK", PAGEPERBLOCK);
		request.setAttribute("totPage", totPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		if (keyword == null || keyword.equals("")) {
			List<Board> list = bd.list(category, startRow, endRow);
			request.setAttribute("list", list);
			return "adminBoardNotice.jsp";
		} else {

			List<Board> list = bd.search2(startRow, endRow, keyword);

			request.setAttribute("list", list);
			request.setAttribute("keyword", keyword);
			return "adminBoardNotice.jsp";
		}

	}
}