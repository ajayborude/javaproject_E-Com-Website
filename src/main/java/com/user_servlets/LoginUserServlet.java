package com.user_servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entities.UserDetails;
import com.helper.FactoryProvider;
import com.userDao.UserDao;

public class LoginUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		HttpSession httpsession = request.getSession();
		
		UserDao userdao = new UserDao(FactoryProvider.getFactory());
		
		UserDetails ud=userdao.getUserByEmailAndPassword(email, pass);
		
		if (ud == null)
		{
			httpsession.setAttribute("error-msg", "Invalid Login Details Please Try Again");
			response.sendRedirect("login_user.jsp");
		}
		else
		{
			httpsession.setAttribute("user-obj", ud);
			if (ud.getUser_type().equals("Normal")) 
			{
				response.sendRedirect("index.jsp");
			}
			else
			{
				response.sendRedirect("Admin/admin_home.jsp");
			}
		}
		
	}

}
