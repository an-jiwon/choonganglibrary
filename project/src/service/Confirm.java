package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class Confirm implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MemberDao md = MemberDao.getInstance();
		int result   = md.confirm(id); 
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		return "confirm.jsp";
	}
}
