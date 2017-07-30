package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class MypageDrop implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");		
		
		MemberDao md = MemberDao.getInstance();
		int result = -1;
			
		result = md.delete(id);
		request.setAttribute("result",result);		
		if (result>0)
			session.invalidate();
		System.out.print("result:"+result);	
		return "drop.jsp";
		
	}

}
