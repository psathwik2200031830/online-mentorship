package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DBConnect;
import com.Entity.Registercourse;
import com.dao.RegistercourseDao;
@WebServlet("/registercourse")
public class CourseRegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId=Integer.parseInt(req.getParameter("userid"));
		String username=req.getParameter("username");
		String gender=req.getParameter("gender");
		String email=req.getParameter("email");
		String phoneno=req.getParameter("phno");
		int teachername=Integer.parseInt(req.getParameter("teachername"));
		String joiningdate=req.getParameter("joiningdate");
        String duration=req.getParameter("duration");		
        
        Registercourse rc=new Registercourse(userId,username,gender,email,phoneno,teachername,joiningdate,duration,"pending");
		RegistercourseDao dao=new RegistercourseDao(DBConnect.getConn());
		HttpSession session=req.getSession();
		if(dao.addregistercourse(rc)){
			session.setAttribute("succMsg", "course registerd successfully");
			resp.sendRedirect("registercourse.jsp");
		}else {
			session.setAttribute("errorMsg", "failed");
			resp.sendRedirect("registercourse.jsp");
			
		}
		
		
		
		
	}
	

}
