package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;

public class FindId implements CommandProcess {


	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		MemberDao md = MemberDao.getInstance();
		Member mem = md.findId(name, phone);
		
		request.setAttribute("mem", mem);
		
		return "findIdResult.jsp";
	}

}
