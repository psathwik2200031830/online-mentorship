package com.admin.servlet;

import java.io.IOException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.Entity.User;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            HttpSession session = req.getSession();

            // Check credentials
            if ("admin@gmail.com".equals(username) && "admin".equals(password)) {
                // Successful login
                session.setAttribute("adminobj", new User());
                resp.sendRedirect("admin/index.jsp");
            } else {
                // Failed login
                session.setAttribute("errorMsg", "Invalid email or password");
                resp.sendRedirect("adminlogin.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
