package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;

public class AdminMemberInfo implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response){
		// TODO Auto-generated method stub
		String pageNum = request.getParameter("pageNum");
		String id = request.getParameter("id");
		
		MemberDao md = MemberDao.getInstance();
		
		Member member = md.select(id);
		request.setAttribute("mem", member);		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("id", id);
	
		return "adminMemberInfo.jsp";
	}

}
