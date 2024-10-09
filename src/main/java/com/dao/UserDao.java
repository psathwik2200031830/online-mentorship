package com.dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.Entity.User;

public class UserDao {

    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }

    public boolean UserRegistration(User u) {
        boolean f = false;
        try {
            String sql = "INSERT INTO user_details(username, email, password) VALUES(?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User login(String em, String psw) {
        User u = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM user_details WHERE username=? AND password=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, em);
            ps.setString(2, psw);
            rs = ps.executeQuery();

            if (rs.next()) {
                u = new User();
                u.setId(rs.getInt(1));
                u.setUsername(rs.getString("username")); // Assuming column name is 'username'
                u.setEmail(rs.getString("email")); // Assuming column name is 'email'
                u.setPassword(rs.getString("password")); // Assuming column name is 'password'
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return u;
    }
}
