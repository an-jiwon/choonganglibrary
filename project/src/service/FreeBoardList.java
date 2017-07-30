package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;

public class FreeBoardList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		final int ROWPERPAGE = 5;
		final int PAGEPERBLOCK = 5;
		//String category = request.getParameter("category");
		String pageNum=request.getParameter("pageNum");
		String keyword=request.getParameter("keyword");
		
		if(pageNum == null || pageNum.equals(""))
			pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		BoardDao bd = BoardDao.getInstance();
		int total   = bd.getTotal2(keyword);
		int startRow = (currentPage - 1)*ROWPERPAGE + 1;
		int endRow = startRow + ROWPERPAGE-1;

		int cnt = (Integer.parseInt(pageNum)-1)*ROWPERPAGE;
		
		int totPage = (int)Math.ceil((double)total/ROWPERPAGE);
		int startPage = currentPage-(currentPage-1)%PAGEPERBLOCK;
		int endPage = startPage + PAGEPERBLOCK - 1;
		if(endPage > totPage)
			endPage = totPage;

		request.setAttribute("cnt", cnt);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("PAGEPERBLOCK", PAGEPERBLOCK);

		request.setAttribute("totPage", totPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		
		if(keyword==null || keyword.equals("")){
			List<Board> list = bd.list(startRow, endRow); 
			request.setAttribute("list", list);
			return "freeBoardList.jsp";
		} else {
			
			List<Board> list = bd.search(startRow, endRow, keyword); 
			
			request.setAttribute("list", list);
			request.setAttribute("keyword", keyword);
			return "freeBoardList.jsp";
		}

	}

}
