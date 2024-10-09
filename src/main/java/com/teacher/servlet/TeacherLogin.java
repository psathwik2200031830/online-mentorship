package com.teacher.servlet;

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

@WebServlet("/teacherlogin")
public class TeacherLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();

        // Check if email or password is empty
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            session.setAttribute("errorMsg", "Email and password cannot be empty");
            resp.sendRedirect("teacherlogin.jsp");
            return;
        }

        TeacherDao dao = new TeacherDao(DBConnect.getConn());
        Teacher teacher = dao.login(email, password);

        if (teacher != null) {
            session.setAttribute("teachObj", teacher);
            resp.sendRedirect("teacher/index.jsp");
        } else {
            session.setAttribute("errorMsg", "Invalid email or password");
            resp.sendRedirect("teacherlogin.jsp");
        }
    }
}
