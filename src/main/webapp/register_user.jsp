<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Comerse:Register Page</title>
<link rel="stylesheet" href="CSS/mystyle.css">
<%@include file="CSS/all_css_js_jq_links.jsp"%>
</head>
<body style="background: #EAEAEA">

	<%@include file="ComenElements/navbar.jsp"%>

	<div class="container my-3">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-header text-center text-white bg-success">
					<img alt="" src="Images/user_icon.jfif"
						style="height: 50px; width: 50px; border-radius: 50%;">
					<h5>Sign Up Here !!</h5>
				</div>
				<div class="card-body">


					<%
					String suc_msg = (String) session.getAttribute("suc-msg");
					if (suc_msg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=suc_msg%><br>
						<a href="login_user.jsp" class="alert-link">Click here to Login</a>
					</div>
					<%
					}
					session.removeAttribute("suc-msg");
					%>


					<form action="RegisterUserServlet" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label for="exampleInputname1">Name</label> <input type="text"
								class="form-control form-control-sm" id="exampleInputname1"
								aria-describedby="text" name="name"
								placeholder="Enter your name">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" name="email" class="form-control form-control-sm"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Enter your email">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" name="password"
								class="form-control form-control-sm" id="exampleInputPassword1"
								placeholder="Password">
						</div>
						<div class="form-group">
							<label for="exampleInputname1">Mobile No</label> <input
								type="text" class="form-control form-control-sm"
								id="exampleInputname1" name="mob_no" aria-describedby="text"
								placeholder="Enter your name">
						</div>
						<div class="form-group">
							<label for="exampleFormControlFile1">Upload Profile
								Picture</label> <input type="file"
								class="form-control-file form-control-sm" name="profile_picture"
								id="exampleFormControlFile1">
						</div>
						<div class="form-group">
							<label for="exampleInputname1">Address</label>
							<textarea class="form-control form-control-sm" name="address"
								id="exampleFormControlTextarea1" rows="3"></textarea>
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