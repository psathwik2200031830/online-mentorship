package com.Entity;

public class Teacher {
    private int id;
    private String fullname;
    private String dob;
    private String qualification; // changed from Qualification to qualification
    private String specialization;
    private String email;
    private String mobno;
    private String password;

    // Default constructor
    public Teacher() {
    }

    // Constructor with all parameters
    public Teacher(int id, String fullname, String dob, String qualification, String specialization, String email,
                   String mobno, String password) {
        this.id = id;
        this.fullname = fullname;
        this.dob = dob;
        this.qualification = qualification; // corrected to use camelCase
        this.specialization = specialization;
        this.email = email;
        this.mobno = mobno;
        this.password = password;
    }

    // Constructor without ID
    public Teacher(String fullname, String dob, String qualification, String specialization, String email,
                   String mobno, String password) {
        this.fullname = fullname;
        this.dob = dob;
        this.qualification = qualification; // corrected to use camelCase
        this.specialization = specialization;
        this.email = email;
        this.mobno = mobno;
        this.password = password;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getQualification() {
        return qualification; // corrected to use camelCase
    }

    public void setQualification(String qualification) {
        this.qualification = qualification; // corrected to use camelCase
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobno() {
        return mobno;
    }

    public void setMobno(String mobno) {
        this.mobno = mobno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
