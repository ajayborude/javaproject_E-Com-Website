<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Comerse:Cheackout Page</title>
<link rel="stylesheet" href="CSS/mystyle.css">
<%@include file="CSS/all_css_js_jq_links.jsp"%>
</head>
<body>

	<%@include file="ComenElements/navbar.jsp"%>
	
	
	<%
    ud = (UserDetails) session.getAttribute("user-obj");

	if (ud == null)
	{
		session.setAttribute("error-msg", "Please Login First To Checkout the Items");
		response.sendRedirect("login_user.jsp");
		return;
	}
	%>
	

	<div class="container mt-3">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<h5 class="text-center mt-3 mb-4">Your Selected Items</h5>
					<div class="cart-body"></div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<h5 class="text-center mt-3 mb-4">Your Details for Order</h5>
					<div class="card-body">
						<form class="needs-validation" novalidate>
							<div class="form-row">
								<div class="col-md-6 mb-3">
									<label for="validationTooltip01">First name</label> <input
										type="text" class="form-control" id="validationTooltip01"
										placeholder="First name" required>
									<div class="valid-tooltip">Looks good!</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="validationTooltip02">Last name</label> <input
										type="text" class="form-control" id="validationTooltip02"
										placeholder="Last name" required>
									<div class="valid-tooltip">Looks good!</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col-md-6 mb-3">
									<label for="validationTooltipUsername">Email</label>
									<div class="input-group">
										<input type="text" class="form-control"
											id="validationTooltipUsername" placeholder="Email"
											aria-describedby="validationTooltipUsernamePrepend" required>
										<div class="invalid-tooltip">Please choose a unique and
											valid username.</div>
									</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="validationTooltip02">Mobile No</label> <input
										type="text" class="form-control" id="validationTooltip02"
										placeholder="Mobile No" required>
									<div class="valid-tooltip">Looks good!</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col-md-6 mb-3">
									<label for="validationTooltip03">City</label> <input
										type="text" class="form-control" id="validationTooltip03"
										placeholder="City" required>
									<div class="invalid-tooltip">Please provide a valid city.
									</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="validationTooltip04">State</label> <input
										type="text" class="form-control" id="validationTooltip04"
										placeholder="State" required>
									<div class="invalid-tooltip">Please provide a valid
										state.</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col-md-6 mb-3">
									<label for="validationTooltip03">Country</label> <input
										type="text" class="form-control" id="validationTooltip03"
										placeholder="Country" required>
									<div class="invalid-tooltip">Please provide a valid city.
									</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="validationTooltip05">Pin Code</label> <input
										type="text" class="form-control" id="validationTooltip05"
										placeholder="Zip" required>
									<div class="invalid-tooltip">Please provide a valid zip.
									</div>
								</div>
							</div>
							<button class="btn btn-outline-primary btn-sm px-3" type="submit">Proceed
								to Checkout</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>