package com.user.servlet;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DBConnect;
import com.Entity.User;
import com.dao.UserDao;

@WebServlet("/user_register")
public class UserRegistration extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
		    String fullName = req.getParameter("username");
		    String email = req.getParameter("email");
		    String password = req.getParameter("password");

		    User u = new User(fullName, email, password);
		    UserDao dao = new UserDao(DBConnect.getConn());
		    HttpSession session=req.getSession()
;
		    boolean f = dao.UserRegistration(u);
		    
		    if (f) {
				   session.setAttribute("sucMsg","Registered successfully");
                 resp.sendRedirect("Register.jsp");
		    } else {
		    	   session.setAttribute("errorMsg","Registeration  unsuccessfull");
	                 resp.sendRedirect("Register.jsp");
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}}


}

