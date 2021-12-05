<%@page import="java.util.Map"%>
<%@page import="com.helper.Helper"%>
<%@page import="com.entities.CatagoryDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.userDao.CatagoryDao"%>
<%@page import="com.entities.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Comerse:Home Page</title>
<link rel="stylesheet" href="../CSS/mystyle.css">
<link rel="stylesheet" href="../Admin/style_admin.css">
<%@include file="../CSS/all_css_js_jq_links.jsp"%>
</head>

<body>
	<!-- ==============Navbar================ -->
	<%@include file="../Admin/navbar_admin.jsp"%>


	<%
	UserDetails ud = (UserDetails) session.getAttribute("user-obj");

	if (ud == null) {
		session.setAttribute("error-msg", "Please Login First...");
		response.sendRedirect("../login_user.jsp");
		return;
	}

	else {
		if (ud.getUser_type().equals("Normal")) {
			session.setAttribute("error-msg", "You can't access this page because you are not an Admin");
			response.sendRedirect("../login_user.jsp");
			return;
		}
	}
	%>


	<div class="container mt-3">
		<%
		String suc_msg = (String) session.getAttribute("suc-msg");
		if (suc_msg != null) {
		%>
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<strong>Hay Ajay !! </strong><%=suc_msg%>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%
		}
		session.removeAttribute("suc-msg");
		%>
	</div>

	<%
	CatagoryDao cataDao = new CatagoryDao(FactoryProvider.getFactory());
	List<CatagoryDetails> cata_list = cataDao.getCategories();
	
	Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
	%>

	<div class="container mt-5">
		<div class="row text-center">
			<div class="col-md-4">
				<a href="lohgy.jsp" style="text-decoration: none;">
					<div class="card card-hover">
						<div class="card-body">
							<img alt="" src="../Images/user.png"
								style="height: 100px; width: 150px;">
							<p style="font-weight: bold; margin: 0%; padding: 0%;"><%=m.get("userCounts") %></p>
							<h5>Users</h5>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="" style="text-decoration: none;">
					<div class="card card-hover">
						<div class="card-body">
							<img alt="" src="../Images/prod.png"
								style="height: 100px; width: 150px;">
							<p style="font-weight: bold; margin: 0%; padding: 0%;"><%=m.get("productConts") %></p>
							<h5>Products</h5>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="" style="text-decoration: none;">
					<div class="card card-hover">
						<div class="card-body">
							<img alt="" src="../Images/cato.jfif"
								style="height: 100px; width: 150px;">
							<p style="font-weight: bold; margin: 0%; padding: 0%;"><%=cata_list.size() %></p>
							<h5>Categories</h5>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<div class="container mt-3">
		<div class="row text-center">
			<div class="col-md-6">
				<a href="add_product.jsp" style="text-decoration: none;">
					<div class="card card-hover">
						<div class="card-body">
							<img alt="" src="../Images/add_prod.png"
								style="height: 100px; width: 150px;">
							<p style="font-weight: bold; margin-bottom=15px; padding: 0%;"></p>
							<h5>Add Products</h5>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="" data-toggle="modal" data-target="#exampleModal"
					style="text-decoration: none;">
					<div class="card card-hover">
						<div class="card-body">
							<img alt="" src="../Images/add_cato.jfif"
								style="height: 100px; width: 150px;">
							<p style="font-weight: bold; margin-bottom=15px; padding: 0%;"></p>
							<h5>Add Categories</h5>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="../ProductOperationServlet" method="post">
					<div class="modal-header">
						<h5 class="modal-title text-center" id="exampleModalLabel">Enter
							Category Details</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" name="operation" value="add_category">
						<div class="form-group">
							<input type="text" name="title" class="form-control"
								id="exampleInputtitle" aria-describedby="title"
								placeholder="Enter Title">
						</div>
						<div class="form-group">
							<input type="text" name="cato_desc" class="form-control"
								id="exampleInputtitle" placeholder="Enter About Category">
						</div>
					</div>
					<div class="modal-footer text-center">
						<button type="submit" class="btn btn-primary btn-sm">Add
							Category</button>
						<button type="button" class="btn btn-secondary btn-sm px-3"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>