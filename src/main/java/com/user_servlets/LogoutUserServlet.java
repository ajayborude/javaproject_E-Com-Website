package com.user_servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LogoutUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		session.getAttribute("user-obj");
		session.removeAttribute("user-obj");

		session.setAttribute("error-msg", "You Have Successfully Logout");
		response.sendRedirect("login_user.jsp");
	}

}
