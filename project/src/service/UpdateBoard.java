package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDao;
import model.Board;

public class UpdateBoard implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MultipartRequest multi = null;
		

		int sizeLimit = 50 * 1024 * 1024; // 50메가입니다.

		String savePath = request.getSession().
				getServletContext().getRealPath("/upload"); // 파일이 업로드될 실제 tomcat
															// 폴더의 WebContent 기준

		try {

			multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		int num = Integer.parseInt(multi.getParameter("num"));
		String pageNum = multi.getParameter("pageNum");
		String title = multi.getParameter("title");
		String category = multi.getParameter("sel");
		String board_main = multi.getParameter("content");
		String file = multi.getFilesystemName("board_file");
		Board board = new Board();
		board.setNum(num);
		board.setTitle(title);
		board.setCategory(category);
		board.setBoard_main(board_main);
		board.setBoard_file(file);
		BoardDao bd = BoardDao.getInstance();
		int result = bd.update(board);
		
		
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		return "updateBoard.jsp";
	}

}
