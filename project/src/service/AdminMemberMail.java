package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.SimpleEmail;

import dao.MemberDao;
import model.Member;

public class AdminMemberMail implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		String subject = request.getParameter("subject");
		String msg = request.getParameter("msg");
		MemberDao md = MemberDao.getInstance();
		List<Member> list = md.maillist();
		System.out.println(list);

		for (int i = 0; i < list.size(); i++) {
			
		SimpleEmail se = new SimpleEmail();
		Member to = list.get(i);
		se.setHostName("smtp.daum.net");
		se.setSmtpPort(465);
		se.setAuthenticator(new DefaultAuthenticator("rho1228", "!library"));			
		
			try {
				se.setSSLOnConnect(true);
				se.addCc(to.getEmail());
				System.out.println(to.getEmail());
				se.setFrom("rho1228@daum.net");
				se.setSubject(subject);
				se.setMsg(msg);				
				se.send();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

		}
		return "adminMemberMailResult.jsp";
	}
}
