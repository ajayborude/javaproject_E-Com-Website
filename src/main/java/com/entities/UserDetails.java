package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class UserDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "User_Id")
	private int user_id;
	@Column(name = "Name")
	private String name;
	@Column(name = "Email")
	private String email;
	@Column(name = "Password")
	private String password;
	@Column(name = "Mobile_No")
	private String mobile_no;
	@Column(name = "Profile_Picture")
	private String profile_picture;
	@Column(name = "Address", length = 1500)
	private String address;
	@Column(name = "User_Type")
	private String user_type;
	

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile_no() {
		return mobile_no;
	}

	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}

	public String getProfile_picture() {
		return profile_picture;
	}

	public void setProfile_picture(String profile_picture) {
		this.profile_picture = profile_picture;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public UserDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserDetails(String name, String email, String password, String mobile_no, String profile_picture,
			String address, String user_type) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.mobile_no = mobile_no;
		this.profile_picture = profile_picture;
		this.address = address;
		this.user_type = user_type;
	}

	public UserDetails(int user_id, String name, String email, String password, String mobile_no,
			String profile_picture, String address, String user_type) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.mobile_no = mobile_no;
		this.profile_picture = profile_picture;
		this.address = address;
		this.user_type = user_type;
	}

	@Override
	public String toString() {
		return "UserDetails [user_id=" + user_id + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", mobile_no=" + mobile_no + ", profile_picture=" + profile_picture + ", address=" + address
				+ ", user_type=" + user_type + "]";
	}
		
}
