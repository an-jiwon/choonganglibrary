package service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BookDao;
import dao.MemberDao;
import model.Book;
import model.Member;

public class AdminBookUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MultipartRequest multi = null;		

		int sizeLimit = 50 * 1024 * 1024; 

		String savePath = request.getSession().
				getServletContext().getRealPath("/bookImage"); 
													
		try {

			multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

		} catch (Exception e) {

			e.printStackTrace();

		}		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String pageNum = multi.getParameter("pageNum");
		int book_id = Integer.parseInt(multi.getParameter("book_id"));
		String title = multi.getParameter("title");
		String category = multi.getParameter("category");
		String author = multi.getParameter("author");
		String company = multi.getParameter("company");
		String book_pub= multi.getParameter("book_public");
		Date book_public= Date.valueOf(book_pub);
		String area = multi.getParameter("area");
		String giho = multi.getParameter("giho");
		String book_index = multi.getParameter("book_index");
		String image = multi.getFilesystemName("image");

		Book book = new Book();
		book.setTitle(title);
		book.setArea(area);
		book.setAuthor(author);
		book.setBook_index(book_index);
		book.setBook_public(book_public);
		book.setCategory(category);
		book.setCompany(company);
		book.setGiho(giho);
		book.setImage(image);
		book.setBook_id(book_id);
		
		BookDao bd = BookDao.getInstance();
		
		int result = bd.update(book);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		System.out.println(result);
		return "adminBookUpdate.jsp";
	}

}
