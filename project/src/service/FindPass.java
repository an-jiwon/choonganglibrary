package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;

public class FindPass implements CommandProcess {


	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String id = request.getParameter("id");
		
		MemberDao md = MemberDao.getInstance();
		Member mem = md.findPass(name, phone, id);
		
		request.setAttribute("mem", mem);
		
		return "findPassResult.jsp";
	}

}
