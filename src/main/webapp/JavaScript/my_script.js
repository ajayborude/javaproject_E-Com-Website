function add_to_cart(p_id, p_name, p_price) {
	let cart = localStorage.getItem("cart")
	if (cart == null) {
		//No items in cart	
		let products = [];

		let product = { productId: p_id, productName: p_name, productQuentity: 1, productPrice: p_price };

		products.push(product);

		localStorage.setItem("cart", JSON.stringify(products));
		
		showToast("Item is Added to Cart")

	}
	else {
		//cart is alredy present

		let pcart = JSON.parse(cart);

		let oldProduct = pcart.find((item) => item.productId == p_id)

		if (oldProduct) {
			oldProduct.productQuentity = oldProduct.productQuentity + 1

			pcart.map((item) => {

				if (item.productId == oldProduct.productId) {
					item.productQuentity = oldProduct.productQuentity;
					localStorage.setItem("cart", JSON.stringify(pcart))
					showToast("Product Quentuity is Increased")
				}

			})
		}
		else {
			let product = { productId: p_id, productName: p_name, productQuentity: 1, productPrice: p_price };
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart))
			showToast("Item is Added to Cart")
		}
	}

	update_cart()

}


function update_cart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {
		console.log("Cart is Empty")
		$(".cart-item").html("( 0 )");

		$(".cart-body").html("<h4>You don't have any items in your cart</h4>");
		$(".chek_btn").addClass(`disabled`);
	}
	else {
		console.log(cart)
		$(".cart-item").html(`( ${cart.length} )`);
		let table = `
		
		<table class = 'table'>
		<thead class = 'thead-light'>
		<tr>
		<th>Item Name</th>
		<th>Price</th>
		<th>Quentity</th>
		<th>Total Price</th>
		<th>Action</th>
		</tr>
		
		</thead>
		
		` ;

		let total_prize = 0;
		cart.map((item) => {
			table += `
			<tr>
			<td>${item.productName}</td>
			<td>${item.productPrice}</td>
			<td>${item.productQuentity}</td>
			<td>${item.productQuentity * item.productPrice}</td>
			<td><button onclick='deleteItemFromCart(${item.productId})' class="btn btn-outline-danger btn-sm px-3">Remove</button></td>
			</tr>`

			total_prize += item.productPrice * item.productQuentity;
		})
		table += `
			<tr>
			<th>Total Prize:</th>
			<td></td>
			<td></td>
			<td>${total_prize}</td>
			<td></td>
			</tr>`
		table = table + `</table>`
		$(".cart-body").html(table);
		$(".chek_btn").removeClass(`disabled`);
	}
}


function deleteItemFromCart(p_id) {
	let cart = JSON.parse(localStorage.getItem("cart"))

	let newcart = cart.filter((item) => item.productId != p_id)

	localStorage.setItem('cart', JSON.stringify(newcart))

	update_cart();
	showToast("Item is Removed from Cart")
}



$(document).ready(function() {
	update_cart()
})


function showToast(content) {
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(() => {
		$("#toast").removeClass("display");
	}, 2000);
}