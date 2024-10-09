package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DBConnect;
import com.Entity.User;
import com.dao.SpecialistDao;
@WebServlet("/addSpecialist")
public class AddSpecialization extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String specname=req.getParameter("specialization_name");
		SpecialistDao dao=new SpecialistDao(DBConnect.getConn());
		boolean f=dao.addSpecialist(specname);
		HttpSession session=req.getSession();
				if (f) {
             // Successful login
             session.setAttribute("succMsg", "Specialization Added");
             resp.sendRedirect("admin/index.jsp");
         } else {
             // Failed login
             session.setAttribute("errorMsg", "something wrong on server");
             resp.sendRedirect("admin/index.jsp");
         }
	}

}
