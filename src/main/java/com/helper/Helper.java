package com.helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {

	public static String get10Words(String desc) {
		String[] strings = desc.split(" ");

		if (strings.length > 10) {
			String result = "";
			for (int i = 0; i < 10; i++) {
				result = result + strings[i] + " ";
			}
			return (result + "...");
		} else {
			return (desc + "...");
		}

	}
	
	
	public static Map<String, Long> getCounts(SessionFactory factory)
	{
		Session session=factory.openSession();
		
		String query1=" select count(*) from UserDetails ";
		String query2=" select count(*) from ProductDetails ";
		
		Query q1=session.createQuery(query1);
		Query q2=session.createQuery(query2);
		
		Long userCounts=(Long)q1.list().get(0);
		
		Long productConts=(Long)q2.list().get(0);
		
		Map<String, Long> map=new HashMap<String, Long>();
		
		map.put("userCounts", userCounts);
		map.put("productConts", productConts);
		
		session.close();
		
		return map;
	}
}