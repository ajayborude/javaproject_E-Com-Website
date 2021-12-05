package com.userDao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.UserDetails;

public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	public UserDetails getUserByEmailAndPassword(String email, String password)
	{
		UserDetails ud = null;
		try 
		{
			String queary="from UserDetails where email=:e and password=:p";
			Session hibernate_session=this.factory.openSession();
			
			Query q=hibernate_session.createQuery(queary);
			q.setParameter("e", email);
			q.setParameter("p", password);
			ud=(UserDetails)q.uniqueResult();
			
			hibernate_session.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return ud;
	}
}
