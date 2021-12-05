package com.userDao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.CatagoryDetails;

public class CatagoryDao {

	public SessionFactory factory;

	public CatagoryDao(SessionFactory factory) {
		this.factory = factory;
	}

	public int saveCategory(CatagoryDetails cd) {
		Session hybernate_session = this.factory.openSession();
		Transaction transaction = hybernate_session.beginTransaction();
		int catagory_id = (Integer) hybernate_session.save(cd);
		hybernate_session.close();
		return catagory_id;
	}
	
	public List<CatagoryDetails> getCategories()
	{
		Session session=this.factory.openSession();
		
		String s="from CatagoryDetails";
		Query query=session.createQuery(s);
		List<CatagoryDetails> cato_list=query.list();
		
		session.close();
		return cato_list;
	}
	
	public CatagoryDetails getCatagoryById(int cat_id)
	{
		CatagoryDetails catagoryDetails = null;
		
		Session session= this.factory.openSession();
		catagoryDetails=session.get(CatagoryDetails.class, cat_id);
		
		session.close();
		return catagoryDetails;
	}
}

