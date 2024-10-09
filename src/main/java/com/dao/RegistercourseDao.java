package com.dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Registercourse;

public class RegistercourseDao {
private Connection conn;

public RegistercourseDao(Connection conn) {
	super();
	this.conn=conn;
	// TODO Auto-generated constructor stub
}
       public boolean addregistercourse(Registercourse rc) {
    	   boolean f=false;
    	    try {
    	    	String sql="insert into courseregister(user_id,username,gender,email,phoneno,teachername,joiningdate,duration,status) values(?,?,?,?,?,?,?,?,?)";
    	    	PreparedStatement ps=conn.prepareStatement(sql);
    	    	ps.setInt(1, rc.getUserId());
    	    	ps.setString(2, rc.getUsername());
    	    	ps.setString(3, rc.getGender());
    	    	ps.setString(4, rc.getEmail());
    	    	ps.setString(5,rc.getPhoneno());
    	    	ps.setInt (6,rc.getTeachername());
    	    	ps.setString(7, rc.getJoiningdate());
    	    	ps.setString(8, rc.getDuration());
    	    	ps.setString(9, rc.getStatus());
    	    	
    	    	int i=ps.executeUpdate();
    	    	if(i==1) {
    	    		f=true;
    	    	}
    	    	
    	    	
    	    	
    	    }catch (Exception e) {
               e.printStackTrace();
    	    }
    	   return f;
       }
public List<Registercourse> getallCourseRegisteredStudents(int userId){
	List<Registercourse> list =new ArrayList<Registercourse>();
	Registercourse  rc=null;
	   try {
		   String sql="select * from courseregister WHERE user_id=? ";
		   PreparedStatement ps=conn.prepareStatement(sql);
		   ps.setInt(1, userId);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next()) {
			   rc=new Registercourse();
			   rc.setId(rs.getInt(1));
			   rc.setUserId(rs.getInt(2));
			   rc.setUsername(rs.getString(3));
			   rc.setGender(rs.getString(4));
			   rc.setEmail(rs.getString(5));
			   rc.setPhoneno(rs.getString(6));
			   rc.setTeachername(rs.getInt(7));
			   rc.setJoiningdate(rs.getString(8));
			   rc.setDuration(rs.getString(9));
			   rc.setStatus(rs.getString(10));
			   list.add(rc);
			   
		   }
		   
	   }catch (Exception e) {
          e.printStackTrace();
	   }
	
	
	
	return list;
}

public List<Registercourse> getallregisteredbystudents(int userId){
	List<Registercourse> list=new ArrayList<Registercourse>();
	Registercourse rc=null;
	try {
		String sql="select * from courseregister WHERE user_id=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, userId);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			rc=new Registercourse();
			rc.setId(rs.getInt(1));
			rc.setUserId(rs.getInt(2));
			rc.setUsername(rs.getString(3));
			rc.setGender(rs.getString(4));
			rc.setEmail(rs.getString(5));
			rc.setPhoneno(rs.getString(6));
			rc.setTeachername(rs.getInt(7));
			rc.setJoiningdate(rs.getString(8));
			rc.setDuration(rs.getString(9));
			rc.setStatus(rs.getString(10));
			
			list.add(rc);
			
			
		}
		
	}catch (Exception e) {
           e.printStackTrace();
	 }
	return list;
}

public List<Registercourse> getallregisteredbyTeacher(int teachername){
	List<Registercourse> list=new ArrayList<Registercourse>();
	Registercourse rc=null;
	try {
		String sql="select * from courseregister WHERE teachername=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, teachername);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			rc=new Registercourse();
			rc.setId(rs.getInt(1));
			rc.setUserId(rs.getInt(2));
			rc.setUsername(rs.getString(3));
			rc.setGender(rs.getString(4));
			rc.setEmail(rs.getString(5));
			rc.setPhoneno(rs.getString(6));
			rc.setTeachername(rs.getInt(7));
			rc.setJoiningdate(rs.getString(8));
			rc.setDuration(rs.getString(9));
			rc.setStatus(rs.getString(10));
			
			list.add(rc);
			
			
		}
		
	}catch (Exception e) {
           e.printStackTrace();
	 }
	return list;
}

public Registercourse getregisterdbyid(int id) {
    Registercourse rc = null;
    try {
        String sql = "SELECT * FROM courseregister WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            rc = new Registercourse();
            rc.setId(rs.getInt(1));
            rc.setUserId(rs.getInt(2));
            rc.setUsername(rs.getString(3));
            rc.setGender(rs.getString(4));
            rc.setEmail(rs.getString(5));
            rc.setPhoneno(rs.getString(6));
            rc.setTeachername(rs.getInt(7));
            rc.setJoiningdate(rs.getString(8));
            rc.setDuration(rs.getString(9));
            rc.setStatus(rs.getString(10));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return rc; // Return the Registercourse object, or null if not found
}

public boolean updateCommentStatus(int id, int teachername, String comm) {
    boolean f = false;
    try {
        // Correct SQL syntax
        String sql = "UPDATE courseregister SET status=? WHERE id=? AND teachername=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, comm);
        ps.setInt(2, id);
        ps.setInt(3, teachername);
        
        int i = ps.executeUpdate();
        if (i == 1) {
            f = true;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return f;
}

public List<Registercourse> getallregistered(){
	List<Registercourse> list=new ArrayList<Registercourse>();
	Registercourse rc=null;
	try {
		String sql="select * from courseregister order by id";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			rc=new Registercourse();
			rc.setId(rs.getInt(1));
			rc.setUserId(rs.getInt(2));
			rc.setUsername(rs.getString(3));
			rc.setGender(rs.getString(4));
			rc.setEmail(rs.getString(5));
			rc.setPhoneno(rs.getString(6));
			rc.setTeachername(rs.getInt(7));
			rc.setJoiningdate(rs.getString(8));
			rc.setDuration(rs.getString(9));
			rc.setStatus(rs.getString(10));
			
			list.add(rc);
			
			
		}
		
	}catch (Exception e) {
           e.printStackTrace();
	 }
	return list;
}


}
