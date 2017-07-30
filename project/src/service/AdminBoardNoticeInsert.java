package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDao;
import model.Board;

public class AdminBoardNoticeInsert implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		MultipartRequest multi = null;		

		int sizeLimit = 50 * 1024 * 1024; // 

		String savePath = request.getSession().
				getServletContext().getRealPath("/uploadNotice"); 
														
		try {

			multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

		} catch (Exception e) {

			e.printStackTrace();

		}
		Board board = new Board();
		BoardDao bd = BoardDao.getInstance();
		int num = bd.getNum();
		String category = multi.getParameter("category");
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String content = multi.getParameter("content");
		String file = multi.getFilesystemName("board_file");
		/*System.out.println(num);
		System.out.println(title);
		System.out.println(file);
		System.out.println(content);
		System.out.println(category);*/
		board.setNum(num);
		board.setCategory(category);
		board.setTitle(title);
		board.setWriter(writer);
		board.setBoard_main(content);
		board.setBoard_file(file);

/*		System.out.println(title);
		System.out.println(writer);
		System.out.println(category);
		System.out.println(content);
		System.out.println(file);*/

		
		int result = bd.insert(board);
		request.setAttribute("result", result);
		
		return "adminBoardNoticeInsert.jsp";

	}
}
