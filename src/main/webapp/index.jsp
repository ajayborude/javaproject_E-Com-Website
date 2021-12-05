<%@page import="com.helper.Helper"%>
<%@page import="com.entities.CatagoryDetails"%>
<%@page import="com.userDao.CatagoryDao"%>
<%@page import="com.entities.ProductDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.userDao.ProductDao"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Comerse:Home Page</title>
<link rel="stylesheet" href="CSS/mystyle.css">
<%@include file="CSS/all_css_js_jq_links.jsp"%>
</head>
<body>

	<%@include file="ComenElements/navbar.jsp"%>

	<%
	CatagoryDao catagoryDao = new CatagoryDao(FactoryProvider.getFactory());
	List<CatagoryDetails> cat_list = catagoryDao.getCategories();

	ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
	String category = request.getParameter("category");
	List<ProductDetails> list = null;

	if (category == null || category.trim().equals("all")) {
		list = productDao.getAllProducts();
	} else {
		int cat_id = Integer.parseInt(category.trim());
		list = productDao.getAllProductsById(cat_id);
	}
	%>


	<div class="container-fluid mt-3">
		<div class="row">
			<div class="col-md-2">
				<div class="categories">
					<div class="list-group">
						<a href="index.jsp?category=all"
							class="list-group-item list-group-item-action active"> All
							Categories </a>
						<%
						for (CatagoryDetails catagoryDetails : cat_list) {
							if (catagoryDetails.equals("category")) {
						%>
						<a href="index.jsp?category=<%=catagoryDetails.getCot_id()%>"
							class="list-group-item list-group-item-action active"><%=catagoryDetails.getCat_title()%></a>
						<%
						} else {
						%>
						<a href="index.jsp?category=<%=catagoryDetails.getCot_id()%>"
							class="list-group-item list-group-item-action"><%=catagoryDetails.getCat_title()%></a>
						<%
						}

						}
						%>
					</div>
				</div>
			</div>
			<div class="col-md-10">
				<div class="row">

					<%
					for (ProductDetails productDetails : list) {
					%>
					<div class="col-md-4 mb-4">
						<div class="card product-card">
							<div class="card-header text-center">
								<img class="card-img-top"
									src="Images/Products_Images/<%=productDetails.getProd_picture()%>"
									alt="Card image cap" style="width: 200px; height: 200px;">
							</div>
							<div class="card-body">
								<h6><%=productDetails.getProd_name()%></h6>
								<p><%=Helper.get10Words(productDetails.getProd_discription())%></p>
								<h6 class="text-primary" style="text-decoration: line-through;">
									Price : &#8377;
									<%=productDetails.getProd_price()%></h6>
								<h6 style="font-size: 14px; font-weight: bold;"
									class="text-secodary">
									Upto
									<%=productDetails.getProd_discount()%>% off on this Product
								</h6>
								<h6 class="text-primary">
									Offer Price : &#8377;
									<%=productDetails.getPriceAfterDiscount()%></h6>
							</div>
							<div class="card-footer text-center">
								<button class="btn btn-outline-primary btn-sm"
									onclick="add_to_cart(<%=productDetails.getProduct_id()%>, '<%=productDetails.getProd_name()%>', <%=productDetails.getPriceAfterDiscount()%>)">Add
									to Cart</button>
							</div>
						</div>
					</div>
					<%
					}
					if (list.size() == 0) {
					%>
					<h2 class="text-center mt-5 ml-5">Sorry.....No Items Found in
						this Category</h2>
					<%
					}
					%>

				</div>
			</div>
		</div>
	</div>
</body>
</html>