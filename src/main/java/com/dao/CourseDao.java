package com.dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Courses;
import com.Entity.Teacher;

public class CourseDao {
    private Connection conn;

    public CourseDao(Connection conn) {
        this.conn = conn;
    }
    
    public boolean registerCourse(Courses c) {
        boolean isCourseRegistered = false;
        String sql = "INSERT INTO courses(coursename, coursementor, duration, price, email, mobno) VALUES(?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getCourseName());
            ps.setString(2, c.getCourseMentor());
            ps.setInt(4, c.getPrice());
            ps.setString(5, c.getEmail());
            ps.setString(6, c.getMobileNo());

            isCourseRegistered = ps.executeUpdate() == 1;

        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this
        }
        return isCourseRegistered;
    }

    public List<Courses> getAllCourses() {
        List<Courses> list = new ArrayList<>();
        String sql = "SELECT * FROM courses ORDER BY id DESC";
        
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Courses c = new Courses();
                c.setId(rs.getInt("id")); // Assuming courseId is of type INT
                c.setCourseName(rs.getString("coursename"));
                c.setCourseMentor(rs.getString("coursementor"));
                c.setPrice(rs.getInt("price"));
                c.setEmail(rs.getString("email"));
                c.setMobileNo(rs.getString("mobno"));

                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this
        }
        return list;
    }
    
   

}
