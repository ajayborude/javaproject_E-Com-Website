package com.user_servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.CatagoryDetails;
import com.entities.ProductDetails;
import com.helper.FactoryProvider;
import com.userDao.CatagoryDao;
import com.userDao.ProductDao;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductOperationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String operation = request.getParameter("operation");

			if (operation.trim().equals("add_category")) {

				String title = request.getParameter("title");
				String cato_desc = request.getParameter("cato_desc");

				CatagoryDetails cd = new CatagoryDetails(title, cato_desc);

				CatagoryDao cata_dao = new CatagoryDao(FactoryProvider.getFactory());

				cata_dao.saveCategory(cd);

				HttpSession httpsession = request.getSession();
				httpsession.setAttribute("suc-msg", "Category Has Been Successfully Added !!");
				response.sendRedirect("Admin/admin_home.jsp");
			}

			else if (operation.trim().equals("add_product")) {
				String prod_title = request.getParameter("prod_title");
				String discription = request.getParameter("discription");
				int pPrice = Integer.parseInt(request.getParameter("price"));
				int pDiscount = Integer.parseInt(request.getParameter("discount"));
				int pQuatity = Integer.parseInt(request.getParameter("quantity"));
				int cat_id = Integer.parseInt(request.getParameter("category_id"));

				Part part = request.getPart("photos");
				ProductDetails pd = new ProductDetails();
				pd.setProd_name(prod_title);
				pd.setProd_discription(discription);
				pd.setProd_price(pPrice);
				pd.setProd_discount(pDiscount);
				pd.setProd_qty(pQuatity);
				pd.setProd_picture(part.getSubmittedFileName());

				CatagoryDao catagoryDao = new CatagoryDao(FactoryProvider.getFactory());
				CatagoryDetails catagoryDetails = catagoryDao.getCatagoryById(cat_id);

				pd.setCatagory_details(catagoryDetails);

				ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
         		productDao.saveProduct(pd);

				String path = request.getRealPath("Images") + File.separator + "Products_Images" + File.separator
						+ part.getSubmittedFileName();

				try
				{
				FileOutputStream fileOutputStream=new FileOutputStream(path);
				
				InputStream inputStream=part.getInputStream();
				
				byte []data=new byte[inputStream.available()];
				
				inputStream.read(data);
				
				fileOutputStream.write(data);
				
				inputStream.close();
				fileOutputStream.close();
				}
				catch (Exception e) {
					e.printStackTrace();
				}

				HttpSession httpsession = request.getSession();
				httpsession.setAttribute("suc-msg", "Product` Has Been Successfully Added !!");
				response.sendRedirect("Admin/admin_home.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}