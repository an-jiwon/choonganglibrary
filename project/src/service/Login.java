package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class Login implements CommandProcess{

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		MemberDao md = MemberDao.getInstance();
		int result = md.check(id, passwd); 
		
		HttpSession session = request.getSession();
		
		if (result > 0) {	//
			session.setAttribute("id",id);
			request.setAttribute("id", id);
			return "../login/loginForm.jsp";
		} else {	//
			request.setAttribute("result", result);
			return "../login/login.jsp";
		}
	}
}