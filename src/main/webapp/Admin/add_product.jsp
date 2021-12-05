<%@page import="com.entities.CatagoryDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.userDao.CatagoryDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Comerse:Add Product Page</title>
<link rel="stylesheet" href="../CSS/mystyle.css">
<%@include file="../CSS/all_css_js_jq_links.jsp"%>
</head>
<body style="background: #EAEAEA">
	<!-- ==============Navbar================ -->
	<%@include file="../Admin/navbar_admin.jsp"%>
	<div class="container my-3">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-header text-center text-white bg-success">
					<img alt="" src="../Images/prod.png"
						style="height: 50px; width: 50px; border-radius: 50%;">
					<h5>Add Product Here !!</h5>
				</div>
				<div class="card-body">
					
					<form action="../ProductOperationServlet" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="operation" value="add_product">
						<div class="form-group">
							<label for="exampleInputname1">Title</label> <input type="text"
								class="form-control form-control-sm" id="exampleInputname1"
								aria-describedby="text" name="prod_title"
								placeholder="Enter your name">
						</div>
						<div class="form-group">
							<label for="exampleInputname1">Discription</label>
							<textarea class="form-control form-control-sm" name="discription"
								id="exampleFormControlTextarea1" rows="3"
								placeholder="Enter About Product"></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Price</label> <input
								type="text" name="price" class="form-control form-control-sm"
								id="exampleInputPassword1" placeholder="Enter original price">
						</div>
						<div class="form-group">
							<label for="exampleInputname1">Discount</label> <input
								type="text" class="form-control form-control-sm"
								id="exampleInputname1" name="discount" aria-describedby="text"
								placeholder="Enter price after discount">
						</div>
						<div class="form-group">
							<label for="exampleInputname1">Quantity</label> <input
								type="text" class="form-control form-control-sm"
								id="exampleInputname1" name="quantity" aria-describedby="text"
								placeholder="Enter product quantity">
						</div>
						<%
						CatagoryDao cataDao = new CatagoryDao(FactoryProvider.getFactory());
						List<CatagoryDetails> cata_list = cataDao.getCategories();
						%>

						<div class="form-group">
							<label class="mr-sm-2" for="inlineFormCustomSelect">Select
								Category</label> <select class="custom-select mr-sm-2"
								name="category_id" id="inlineFormCustomSelect">
								<option>---Select Category---</option>
								<%
								for (CatagoryDetails cd : cata_list) {
								%>
								<option value="<%=cd.getCot_id()%>"><%=cd.getCat_title()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<label for="exampleFormControlFile1">Upload Photos </label> <input
								type="file" class="form-control-file form-control-sm"
								name="photos" id="exampleFormControlFile1">
						</div>
						<div class="text-center text-white">
							<button type="submit" class="btn btn-outline-success btn-sm px-3">Register...</button>
							<button type="reset"
								class="btn btn-outline-warning btn-sm px-3 ml-3">Reset...</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>