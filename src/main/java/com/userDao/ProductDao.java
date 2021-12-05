package com.userDao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.ProductDetails;

public class ProductDao {

	public SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveProduct(ProductDetails pd) {
		boolean f = false;
		try
		{
			Session session = this.factory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(pd);
			transaction.commit();
			session.close();
			f = true;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<ProductDetails> getAllProducts()
	{
		
		Session session=this.factory.openSession();
		
		Query query=session.createQuery("From ProductDetails");
		
		List<ProductDetails> list=query.list();
		
		session.close();
		
		return list;
				
	}
	public List<ProductDetails> getAllProductsById(int cat_id)
	{
		
		Session session=this.factory.openSession();
		
		Query query=session.createQuery("From ProductDetails as p where p.catagory_details.cot_id =: id");
		
		query.setParameter("id", cat_id);
		
		List<ProductDetails> list=query.list();
		
		session.close();
		
		return list;
		
	}
	
}