package com.Entity;

public class Registercourse {
	private int id;
	private int userId;
	private String username;
	private String gender;
	private String email;
	private String phoneno;
	private int teachername;
	private String joiningdate;
	private String duration;
	private String status;
	public Registercourse() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Registercourse(int userId, String username, String gender, String email, String phoneno, int teachername,
			String joiningdate, String duration, String status) {
		super();
		this.userId = userId;
		this.username = username;
		this.gender = gender;
		this.email = email;
		this.phoneno = phoneno;
		this.teachername = teachername;
		this.joiningdate = joiningdate;
		this.duration = duration;
		this.status = status;
	}
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public int getTeachername() {
		return teachername;
	}
	public void setTeachername(int teachername) {
		this.teachername = teachername;
	}
	public String getJoiningdate() {
		return joiningdate;
	}
	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
