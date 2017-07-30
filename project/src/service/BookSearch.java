package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookDao;
import dao.CheckOutDao;
import dao.MemberDao;
import model.Book;
import model.CheckOut;
import model.Member;


public class BookSearch implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	
		String searchKeyword = request.getParameter("searchKeyword");
		String category = request.getParameter("category");
		BookDao bd = BookDao.getInstance();
		
		final int ROWPERPAGE = 5;		
		final int PAGEPERBLOCK = 5;		
		
		String pageNum = request.getParameter("pageNum"); 
		if (pageNum == null || pageNum.equals(""))		 
			pageNum="1";
		int currentPage = Integer.parseInt(pageNum);	
		int total = bd.getTotal(searchKeyword,category);	
		int startRow = (currentPage - 1) * ROWPERPAGE + 1 ;	
		int endRow = startRow + ROWPERPAGE - 1 ;			
	
		List<Book> list = bd.list(searchKeyword,category,startRow,endRow);
		for(Book book : list) {
			book.setYear(book.getBook_public().toString().substring(0,4));
		}

		int totPage = (int)Math.ceil((double)total/ROWPERPAGE);	
		int startPage = currentPage - (currentPage - 1)%PAGEPERBLOCK;
		int endPage = startPage + PAGEPERBLOCK - 1;
		if (endPage > totPage) endPage = totPage;
		
		request.setAttribute("searchKeyword", searchKeyword);
		request.setAttribute("category",category);
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("PAGEPERBLOCK", PAGEPERBLOCK);
		request.setAttribute("total", total);
		request.setAttribute("totPage", totPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		return "bookSearch.jsp";
	}
}