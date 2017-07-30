package service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.NRBoardDao;
import model.NRBoard;


public class NRboardWrite implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		MultipartRequest multi = null;
		
		int sizeLimit = 50 * 1024 * 1024;
		
		String savePath = request.getSession().getServletContext().getRealPath("/listfile");
		
		try {
			multi = new MultipartRequest(request, savePath, sizeLimit,  "utf-8", new DefaultFileRenamePolicy());
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		String category = multi.getParameter("category");
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String main = multi.getParameter("main");
		String NRBoard_file = multi.getFilesystemName("NRBoard_file");
		System.out.println(category);
		System.out.println(title);
		System.out.println(writer);
		System.out.println(main);
		System.out.println(NRBoard_file);
		NRBoardDao bd = NRBoardDao.getInstance();
		NRBoard nrboard = new NRBoard();
		int num = bd.getNum();
		
		nrboard.setCategory(category);
		nrboard.setTitle(title);
		nrboard.setWriter(writer);
		nrboard.setMain(main);
		nrboard.setNRBoard_file(NRBoard_file);
		nrboard.setNum(num);
		
		int result =bd.insert(nrboard);
		
		request.setAttribute("result", result);
		
		return "writeResult.jsp";
	}

}
