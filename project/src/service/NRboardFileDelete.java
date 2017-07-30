package service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NRBoardDao;

public class NRboardFileDelete implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		NRBoardDao nd = NRBoardDao.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		String NRBoard_file = request.getParameter("NRBoard_file");
		
		String savePath = request.getSession().getServletContext().getRealPath("/listfile")+"/"+NRBoard_file;
		
		File uploadfile = new File(savePath);
		if (uploadfile.exists() && uploadfile.isFile()) {
			uploadfile.delete();
		}
		
		int result = nd.filedelete(num, NRBoard_file);
		
		request.setAttribute("result", result);
		
		return "filedelte.jsp";
	}

}
