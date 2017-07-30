package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;

public class MypageUpdateForm implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response){
		
		HttpSession session =  request.getSession();
		String id = (String)session.getAttribute("id");		
		if (id == null || id.equals("") || id.equals("null")) {
			return "loginForm.jsp";
			}
		
		MemberDao md = MemberDao.getInstance();
		
		Member member = md.select(id);
		request.setAttribute("mem", member);
		
		return "updateForm.jsp";
	}

}
