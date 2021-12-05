<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Comerse:Login Page</title>
<link rel="stylesheet" href="CSS/mystyle.css">
<%@include file="CSS/all_css_js_jq_links.jsp"%>
</head>
<body style="background: #EAEAEA">

	<%@include file="ComenElements/navbar.jsp"%>

	<div class="container my-3">
		<div class="col-md-4 offset-md-4">
			<form action="LoginUserServlet" method="post">
				<div class="card">
					<div class="card-header text-center ">
						<img alt="" src="Images/user_icon.jfif"
							style="height: 50px; width: 50px; border-radius: 50%;">
						<h5>Login Here</h5>
					</div>
					<div class="card-body">
					
					<%
					String error_msg = (String) session.getAttribute("error-msg");
					if (error_msg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=error_msg%>
					</div>
					<%
					}
					session.removeAttribute("error-msg");
					%>
					
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
					</div>
					<div class="card-footer text-center">
						<button type="submit" class="btn btn-outline-success btn-sm px-3">Login...</button>
						<button type="reset"
							class="btn btn-outline-warning btn-sm px-3 ml-3">Reset...</button>
						<h6 class="mt-2 mb-0">If You Not Having an Account, then</h6>
						<a href="register_user.jsp">Click Here</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>