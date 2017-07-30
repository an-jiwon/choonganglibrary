package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class AdminLogin implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response){
		String adminid = request.getParameter("adminid");
		String passwd = request.getParameter("passwd");
		MemberDao md = MemberDao.getInstance();
		int result = md.adminLoginChk(adminid, passwd);
		HttpSession session = request.getSession();
		if (result > 0) {
			session.setAttribute("adminid", adminid);
			return "../adminpage/adminMain.jsp";
	    } else {
	    	request.setAttribute("result", result);
	    	return "adminLogin.jsp";
	    }
		
		
	}

}
