package com.tech.blog.entities;

public class user {
	

private String name;
private String email;
private String password;
private String gender;
private String about;
private java.sql.Timestamp rdate;
private String profile;

public user() {
		
	}
public user(int id, String name, String email, String password, String gender, String about, java.sql.Timestamp rdate) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.rdate = rdate;
	}

@Override
public String toString() {
	return "user [name=" + name + ", email=" + email + ", password=" + password + ", gender=" + gender + ", about="
			+ about + ", rdate=" + rdate + ", profile=" + profile + ", id=" + id + "]";
}
public user( String name, String email, String password, String gender, String about) {
	super();
	this.id = id;
	this.name = name;
	this.email = email;
	this.password = password;
	this.gender = gender;
	this.about = about;
}

//getter and setters
private int id;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
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
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getAbout() {
	return about;
}
public void setAbout(String about) {
	this.about = about;
}
public java.sql.Timestamp getRdate() {
	return rdate;
}
public void setRdate(java.sql.Timestamp timestamp) {
	this.rdate = timestamp;
}
public String getProfile() {
	return profile;
}
public void setProfile(String profile) {
	this.profile = profile;
}

}
