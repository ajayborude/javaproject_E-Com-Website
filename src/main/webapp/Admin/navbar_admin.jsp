<nav class="navbar navbar-expand-lg navbar-dark bg-costom">
	<div class="container">
		<a class="navbar-brand" style="font-weight: bold;" href="#"><img
			alt="logo" src="../Images/logo.jfif"
			style="width: 25px; height: 25px;"> MyCart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><i class="fas fa-home"></i> Home </a></li>
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><i class="far fa-address-card"></i> About Us </a></li>
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><i class="fas fa-phone-square"></i> Contact Us
				</a></li>
				<form class="form-inline" style="margin-left: 80px;">
					<input class="form-control form-control-sm mr-sm-2" type="search"
						placeholder="Search" aria-label="Search">
					<button
						class="btn btn-outline-success text-white my-2 my-sm-0 btn-sm"
						type="submit">Search</button>
				</form>
			</ul>
			<form class="form-inline my-2 my-lg-0 text-white">
				<a class="btn btn-outline-light btn-sm px-2"
					href="register_user.jsp"><i class="fas fa-cart-plus"></i> Cart</a>
				<a class="btn btn-outline-primary btn-sm text-white ml-3 px-2"
					href="register_user.jsp"><i class="far fa-registered"></i> Ajay
					Borude</a> <a
					class="btn btn-outline-danger btn-sm text-white ml-3 px-2"
					data-toggle="modal" data-target="#exampleModalCenter"><i
					class="fas fa-sign-out-alt"></i> Logout</a>
			</form>
		</div>
	</div>
</nav>




<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Logout
					Massage</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h6>Do you really want to Logout</h6>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="../LogoutUserServlet" class="btn btn-primary px-2">Logout</a>
			</div>
		</div>
	</div>
</div>