package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ProductDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Product_Id")
	private int product_id ;
	@Column(name = "Prod_Name")
	private String prod_name ;
	@Column(name = "Prod_Discription", length = 5000)
	private String prod_discription ;
	@Column(name = "Prod_Picture")
	private String prod_picture ;
	@Column(name = "Prod_Price")
	private int prod_price ;
	@Column(name = "Prod_Discount")
	private int prod_discount ;
	@Column(name = "Prod_Qty")
	private int prod_qty;

	@ManyToOne
	private CatagoryDetails catagory_details;

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getProd_discription() {
		return prod_discription;
	}

	public void setProd_discription(String prod_discription) {
		this.prod_discription = prod_discription;
	}

	public String getProd_picture() {
		return prod_picture;
	}

	public void setProd_picture(String prod_picture) {
		this.prod_picture = prod_picture;
	}

	public int getProd_price() {
		return prod_price;
	}

	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}

	public int getProd_discount() {
		return prod_discount;
	}

	public void setProd_discount(int prod_discount) {
		this.prod_discount = prod_discount;
	}

	public int getProd_qty() {
		return prod_qty;
	}

	public void setProd_qty(int prod_qty) {
		this.prod_qty = prod_qty;
	}

	public CatagoryDetails getCatagory_details() {
		return catagory_details;
	}

	public void setCatagory_details(CatagoryDetails catagory_details) {
		this.catagory_details = catagory_details;
	}

	public ProductDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductDetails(String prod_name, String prod_discription, String prod_picture, int prod_price,
			int prod_discount, int prod_qty, CatagoryDetails catagory_details) {
		super();
		this.prod_name = prod_name;
		this.prod_discription = prod_discription;
		this.prod_picture = prod_picture;
		this.prod_price = prod_price;
		this.prod_discount = prod_discount;
		this.prod_qty = prod_qty;
		this.catagory_details = catagory_details;
	}

	public ProductDetails(int product_id, String prod_name, String prod_discription, String prod_picture,
			int prod_price, int prod_discount, int prod_qty, CatagoryDetails catagory_details) {
		super();
		this.product_id = product_id;
		this.prod_name = prod_name;
		this.prod_discription = prod_discription;
		this.prod_picture = prod_picture;
		this.prod_price = prod_price;
		this.prod_discount = prod_discount;
		this.prod_qty = prod_qty;
		this.catagory_details = catagory_details;
	}

	@Override
	public String toString() {
		return "ProductDetails [product_id=" + product_id + ", prod_name=" + prod_name + ", prod_discription="
				+ prod_discription + ", prod_picture=" + prod_picture + ", prod_price=" + prod_price
				+ ", prod_discount=" + prod_discount + ", prod_qty=" + prod_qty + ", catagory_details="
				+ catagory_details + "]";
	}
	
	
	public int getPriceAfterDiscount()
	{
		int discount=(int)((this.getProd_discount()/100.0)*this.getProd_price());
		return this.getProd_price()-discount;
	}
	
}
