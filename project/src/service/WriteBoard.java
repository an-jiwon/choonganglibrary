package service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDao;
import model.Board;

public class WriteBoard implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
	
		MultipartRequest multi = null;
		

		int sizeLimit = 50 * 1024 * 1024; // 50�ް��Դϴ�.

		String savePath = request.getSession().
				getServletContext().getRealPath("/upload"); // ������ ���ε�� ���� tomcat
															// ������ WebContent ����

		try {

			multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

		} catch (Exception e) {

			e.printStackTrace();

		}

		Board board = new Board();
		BoardDao bd = BoardDao.getInstance();
		int num = bd.getNum();
		String category = multi.getParameter("sel");
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String content = multi.getParameter("content");
		String file = multi.getFilesystemName("board_file");
		board.setNum(num);
		board.setCategory(category);
		board.setTitle(title);
		board.setWriter(writer);
		board.setBoard_main(content);
		board.setBoard_file(file);

		/*System.out.println(title);
		System.out.println(writer);
		System.out.println(category);
		System.out.println(content);
		System.out.println(file);*/

		

		int result = bd.insert(board);
		

		request.setAttribute("result", result);
		return "writeBoard.jsp";

	}

}
