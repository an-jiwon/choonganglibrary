package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import model.Board;

public class MypageWriteList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if (id == null || id.equals("") || id.equals("null")) {
			return "loginForm.jsp";
			}
		final int ROWPERPAGE = 5;
		final int PAGEPERBLOCK = 5;
		//String category = request.getParameter("category");
		String pageNum=request.getParameter("pageNum");
		String keyword=request.getParameter("keyword");
		
		if(pageNum == null || pageNum.equals(""))
			pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		BoardDao bd = BoardDao.getInstance();
		int total   = bd.getTotal0(id);
		int startRow = (currentPage - 1)*ROWPERPAGE + 1;
		int endRow = startRow + ROWPERPAGE-1;

		int cnt = (Integer.parseInt(pageNum)-1)*ROWPERPAGE;
		
		int totPage = (int)Math.ceil((double)total/ROWPERPAGE);
		int startPage = currentPage-(currentPage-1)%PAGEPERBLOCK;
		int endPage = startPage + PAGEPERBLOCK - 1;
		if(endPage > totPage)
			endPage = totPage;
		request.setAttribute("id",id);
		
		request.setAttribute("cnt", cnt);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("PAGEPERBLOCK", PAGEPERBLOCK);
	
		request.setAttribute("totPage", totPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		/*System.out.println(id);
		System.out.println(cnt);
		System.out.println(pageNum);
		System.out.println(currentPage);
		System.out.println(totPage);
		System.out.println(startPage);
		System.out.println(endPage);*/
		

			List<Board> list = bd.mylist(id,startRow, endRow); 

			request.setAttribute("list", list);
			return "writeList.jsp";
	
		}

	}
	


