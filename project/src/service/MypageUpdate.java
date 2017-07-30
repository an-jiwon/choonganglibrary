package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;

public class MypageUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response){
		HttpSession session =  request.getSession();		
		String id = (String)session.getAttribute("id");	
		
		String pass = request.getParameter("newpasswd");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		Member member = new Member();
		
		member.setId(id);
		member.setPass(pass);
		member.setPhone(phone);
		member.setEmail(email);
		member.setZipcode(zipcode);
		member.setAddr1(addr1);
		member.setAddr2(addr2);
		
		/*System.out.println(id);
		System.out.println(pass);
		System.out.println(phone);
		System.out.println(email);
		System.out.println(zipcode);
		System.out.println(addr1);
		System.out.println(addr2);*/
		
		MemberDao md = MemberDao.getInstance();
		
		int result = md.update(member);
		request.setAttribute("result", result);
		System.out.println(result);
		return "update.jsp";
	}

}
