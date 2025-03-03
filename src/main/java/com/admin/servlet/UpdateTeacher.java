package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DBConnect;
import com.Entity.Teacher;
import com.dao.TeacherDao;

@WebServlet("/updateTeacher")
public class UpdateTeacher extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 try {
	            String fullname = req.getParameter("fullname");
	            String dob = req.getParameter("dob");
	            String qualification = req.getParameter("qualification");
	            String specialization = req.getParameter("specialization");
	            String mobno = req.getParameter("mobileno");
	            String email = req.getParameter("email");
	            String password = req.getParameter("password"); 
	             int id=Integer.parseInt(req.getParameter("id")); 

	            Teacher T = new Teacher(id,fullname, dob, qualification, specialization, email, mobno, password);
	            TeacherDao dao = new TeacherDao(DBConnect.getConn());
	            HttpSession session = req.getSession();

	            if (dao.updateTeacher(T)) {
	                session.setAttribute("succMsg", "Teacher added successfully...");
	                resp.sendRedirect("admin/viewteacher.jsp");
	            } else {
	                session.setAttribute("errorMsg", "Something went wrong on server");
	                resp.sendRedirect("admin/viewteacher.jsp");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            req.getSession().setAttribute("errorMsg", "An error occurred: " + e.getMessage());
	            resp.sendRedirect("admin/teacher.jsp");
	        }
	}

}
