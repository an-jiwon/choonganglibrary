package service;

import java.sql.Date;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;


public class Join implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String birth = request.getParameter("birth");
		Date d = Date.valueOf(birth);
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		Member member = new Member();
		member.setId(id);
		member.setPass(pass);
		member.setName(name);
		member.setBirth(d);
		member.setEmail(email);
		member.setPhone(phone);
		member.setZipcode(zipcode);
		member.setAddr1(addr1);
		member.setAddr2(addr2);
		member.setPhone(phone);
		MemberDao md = MemberDao.getInstance();
		int result = md.insert(member);
		request.setAttribute("result", result);
		return "join.jsp";
	}
	
	

}
