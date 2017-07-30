package service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.ReplyDao;
import model.Board;

public class DeleteBoard implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		BoardDao bd = BoardDao.getInstance();
		Board board = bd.download(num);

		String filename = board.getBoard_file();
		String uploadFileName = request.getSession().getServletContext().getRealPath("/upload") +"/"+ filename;

		File uploadfile = new File (uploadFileName);
		if ( uploadfile.exists()&& uploadfile.isFile() ){
			 uploadfile.delete();		// 파일 삭제
		}
		int result = bd.delete(num);
		ReplyDao rd = ReplyDao.getInstance();
		rd.deleteBoard(num);//댓글삭제
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "deleteBoard.jsp";
	}

}
