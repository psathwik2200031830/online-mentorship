package com.Entity;

public class Courses {
    private int id;
    private String courseName;
    private String courseMentor;
    
    private int price; 
    private String email;
    private String mobileNo;
    private Teacher teacher; // Add a Teacher attribute

    // Default constructor
    public Courses() {
        super();
    }

    // Parameterized constructor
    public Courses(int id, String courseName, String courseMentor,  int price,
                   String email, String mobileNo) {
        super();
        this.id = id;
        this.courseName = courseName;
        this.courseMentor = courseMentor;
        this.price = price;
        this.email = email;
        this.mobileNo = mobileNo;
    }
    public Courses( String courseName, String courseMentor,  int price,
                    String email, String mobileNo) {
        super();
        this.courseName = courseName;
        this.courseMentor = courseMentor;
        this.price = price;
        this.email = email;
        this.mobileNo = mobileNo;
    }

    // Getter and Setter methods
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseMentor() {
        return courseMentor;
    }

    public void setCourseMentor(String courseMentor) {
        this.courseMentor = courseMentor;
    }

    

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public Teacher getTeacher() {  // Getter for Teacher
        return teacher;
    }

    public void setTeacher(Teacher teacher) {  // Setter for Teacher
        this.teacher = teacher;
    }
}
