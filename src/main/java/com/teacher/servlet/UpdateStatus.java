package com.teacher.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.Db.DBConnect;
import com.dao.RegistercourseDao;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Parsing parameters
            int id = Integer.parseInt(req.getParameter("id"));
            int tid = Integer.parseInt(req.getParameter("tid"));
            String comm = req.getParameter("comm");

            // Create DAO and session objects
            RegistercourseDao dao = new RegistercourseDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            // Attempt to update comment status
            boolean isUpdated = dao.updateCommentStatus(id, tid, comm);
            if (isUpdated) {
                session.setAttribute("succMsg", "Comment updated successfully.");
            } else {
                session.setAttribute("errorMsg", "Comment not updated.");
            }
            resp.sendRedirect("teacher/Student.jsp"); // Redirect after processing
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsg", "An error occurred while updating the comment.");
            resp.sendRedirect("teacher/Student.jsp");
        }
    }
}
