package com.dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import com.Entity.Courses;
import com.Entity.Teacher;

public class TeacherDao {
    private Connection conn;

    public TeacherDao(Connection conn) {
        this.conn = conn;
    }

    // Register a new teacher
    public boolean registerTeacher(Teacher teacher) {
        boolean isRegistered = false;
        String sql = "INSERT INTO Teacher(fullname, dob, qualification, specialization, email, mobno, password) VALUES(?, ?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, teacher.getFullname());
            ps.setString(2, teacher.getDob());
            ps.setString(3, teacher.getQualification());
            ps.setString(4, teacher.getSpecialization());
            ps.setString(5, teacher.getEmail());
            ps.setString(6, teacher.getMobno());
            ps.setString(7, teacher.getPassword());

            isRegistered = ps.executeUpdate() == 1;

        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this
        }
        return isRegistered;
    }

    // Retrieve all teachers
    public List<Teacher> getAllTeachers() {
        List<Teacher> list = new ArrayList<>();
        String sql = "SELECT * FROM Teacher ORDER BY id DESC";
        
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Teacher T = new Teacher();
                T.setId(rs.getInt(1));
                T.setFullname(rs.getString(2));
                T.setDob(rs.getString(3));
                T.setQualification(rs.getString(4));
                T.setSpecialization(rs.getString(5));
                T.setEmail(rs.getString(6));
                T.setMobno(rs.getString(7));
                T.setPassword(rs.getString(8));

                list.add(T);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this
        }
        return list;
    }

    public Teacher getTeacherById(int id) {
        Teacher T = null;
        String sql = "SELECT * FROM Teacher WHERE id=?";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    T = new Teacher();
                    T.setId(rs.getInt(1));
                    T.setFullname(rs.getString(2));
                    T.setDob(rs.getString(3));
                    T.setQualification(rs.getString(4));
                    T.setSpecialization(rs.getString(5));
                    T.setEmail(rs.getString(6));
                    T.setMobno(rs.getString(7));
                    T.setPassword(rs.getString(8));
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this
        }
        return T;
    }

    // Update teacher information
    public boolean updateTeacher(Teacher teacher) {
        boolean isUpdated = false;
        String sql = "UPDATE Teacher SET fullname=?, dob=?, qualification=?, specialization=?, email=?, mobno=?, password=? WHERE id=?";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, teacher.getFullname());
            ps.setString(2, teacher.getDob());
            ps.setString(3, teacher.getQualification());
            ps.setString(4, teacher.getSpecialization());
            ps.setString(5, teacher.getEmail());
            ps.setString(6, teacher.getMobno());
            ps.setString(7, teacher.getPassword());
            ps.setInt(8, teacher.getId());

            isUpdated = ps.executeUpdate() == 1;

        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this
        }
        return isUpdated;
    }
    
    
    public boolean deleteteacher(int id) {
    	boolean f=false;
    	try {
    		String sql="delete  from Teacher where id=?  ";
    		PreparedStatement ps=conn.prepareStatement(sql);
    		ps.setInt(1, id);
    		int i=ps.executeUpdate();
    		if(i==1) {
    			f=true;
    		}
    		
    	}catch (Exception e) {
          e.printStackTrace();
    	}
    	return f;
    }
    public Teacher login(String email, String password) {
        Teacher teacher = null;
        String sql = "SELECT * FROM Teacher WHERE email = ? AND password = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    teacher = new Teacher();
                    teacher.setId(rs.getInt(1));
                    teacher.setFullname(rs.getString(2));
                    teacher.setDob(rs.getString(3));
                    teacher.setQualification(rs.getString(4));
                    teacher.setSpecialization(rs.getString(5));
                    teacher.setEmail(rs.getString(6));
                    teacher.setMobno(rs.getString(7));
                    teacher.setPassword(rs.getString(8)); // Consider not storing passwords in plain text
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this properly
        }

        return teacher;
    }


	
 


 
    
}
