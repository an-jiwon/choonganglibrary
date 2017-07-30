package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDao;
import model.Board;

public class AdminBoardNoticeUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
			
		
		MultipartRequest multi = null;		

		int sizeLimit = 50 * 1024 * 1024;

		String savePath = request.getSession().
				getServletContext().getRealPath("/uploadNotice"); 
														
		try {

			multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		
		int num = Integer.parseInt(multi.getParameter("num"));

		String pageNum = multi.getParameter("pageNum");
		String title = multi.getParameter("title");
		String board_main = multi.getParameter("content");
		String board_file=multi.getParameter("board_file");
		
		Board board = new Board();
		board.setNum(num);
		board.setTitle(title);
		board.setBoard_main(board_main);
		board.setBoard_file(board_file);
		BoardDao bd = BoardDao.getInstance();
		int result = bd.updateNotice(board);		
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		return "adminBoardNoticeUpdate.jsp";
	}

}
