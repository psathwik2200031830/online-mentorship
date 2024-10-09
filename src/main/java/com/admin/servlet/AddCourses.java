package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DBConnect;
import com.Entity.Courses;
import com.dao.CourseDao;

@WebServlet("/addcourses")
public class AddCourses extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Removed courseId as it will be auto-incremented in the database
            String courseName = req.getParameter("coursename");
            String courseMentor = req.getParameter("coursementor");
            int price = Integer.parseInt(req.getParameter("price"));
            String mobNo = req.getParameter("mobileno");
            String email = req.getParameter("email");

            // Create the Courses object without courseId
            Courses course = new Courses(  courseName,  courseMentor,   price,mobNo   ,email  );
            CourseDao courseDao = new CourseDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            // Call the appropriate method to add the course
            if (courseDao.registerCourse(course)) {
                session.setAttribute("succMsg", "Course added successfully...");
                resp.sendRedirect("admin/course.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong on the server");
                resp.sendRedirect("admin/course.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("errorMsg", "An error occurred: " + e.getMessage());
            resp.sendRedirect("admin/course.jsp");
        }
    }
}
