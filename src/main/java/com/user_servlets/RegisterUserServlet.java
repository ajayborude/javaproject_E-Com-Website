package com.user_servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.UserDetails;
import com.helper.FactoryProvider;
@MultipartConfig
public class RegisterUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		String mob_no=request.getParameter("mob_no");
		String profile_picture=request.getParameter("profile_picture");
		String address=request.getParameter("address");
		
		UserDetails ud = new UserDetails(name, email, pass, mob_no, profile_picture, address, "Normal");
		
		Session session=FactoryProvider.getFactory().openSession();
		Transaction transaction=session.beginTransaction();
		
		int id=(Integer)session.save(ud);
		
		HttpSession httpsession=request.getSession();
		httpsession.setAttribute("suc-msg", "You Have Successfully Register !!");
		response.sendRedirect("register_user.jsp");
		
		transaction.commit();
		session.close();
		
	}

}
