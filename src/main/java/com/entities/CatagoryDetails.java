package com.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class CatagoryDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Cotagory_Id")
	private int cot_id ;
	@Column(name = "Catagory_Title")
	private String cat_title ;
	@Column(name = "Catagory_Discription")
	private String cat_discrip ;
	
	@OneToMany(mappedBy = "catagory_details")
	private List<ProductDetails> prod_list=new ArrayList<ProductDetails>();

	public int getCot_id() {
		return cot_id;
	}

	public void setCot_id(int cot_id) {
		this.cot_id = cot_id;
	}

	public String getCat_title() {
		return cat_title;
	}

	public void setCat_title(String cat_title) {
		this.cat_title = cat_title;
	}

	public String getCat_discrip() {
		return cat_discrip;
	}

	public void setCat_discrip(String cat_discrip) {
		this.cat_discrip = cat_discrip;
	}

	public List<ProductDetails> getProd_list() {
		return prod_list;
	}

	public void setProd_list(List<ProductDetails> prod_list) {
		this.prod_list = prod_list;
	}

	public CatagoryDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CatagoryDetails(int cot_id, String cat_title, String cat_discrip, List<ProductDetails> prod_list) {
		super();
		this.cot_id = cot_id;
		this.cat_title = cat_title;
		this.cat_discrip = cat_discrip;
		this.prod_list = prod_list;
	}

	public CatagoryDetails(String cat_title, String cat_discrip, List<ProductDetails> prod_list) {
		super();
		this.cat_title = cat_title;
		this.cat_discrip = cat_discrip;
		this.prod_list = prod_list;
	}

	public CatagoryDetails(String cat_title, String cat_discrip) {
		super();
		this.cat_title = cat_title;
		this.cat_discrip = cat_discrip;
	}

	@Override
	public String toString() {
		return "CatagoryDetails [cot_id=" + cot_id + ", cat_title=" + cat_title + ", cat_discrip=" + cat_discrip
				+ ", prod_list=" + prod_list + "]";
	}
	
}
