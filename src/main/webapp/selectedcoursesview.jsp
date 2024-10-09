<%@page import="com.dao.TeacherDao"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.RegistercourseDao" %>
<%@page import="com.Entity.Registercourse" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="com.Entity.Teacher"  %>
<%@page import="com.Entity.User"  %>

<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <%@include file="components/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 100px rgba(0, 0, 0, 0.3);
        }
        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: vh; /* Full viewport height to center vertically */
        }
    </style>
</head>
<body>
    <%@include file="components/Navbar.jsp"%>
    
    <div class="container center-container">
        <div class="col-md-9">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-4 fw-bold text-center text-success">SELECTED COURSES</p>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Username</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Email</th>
                                <th scope="col">Phone No</th>
                                <th scope="col">Selected Mentor</th>
                                <th scope="col">Joining Date</th>
                                <th scope="col">Duration</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        <%
                       User user=(User) session.getAttribute("userObj");
                        RegistercourseDao dao=new  RegistercourseDao(DBConnect.getConn());
                        TeacherDao dao2=new TeacherDao(DBConnect.getConn());
                        List<Registercourse> list = dao.getallCourseRegisteredStudents(user.getId());
                        for(Registercourse rc:list){
                        	Teacher T=dao2.getTeacherById(rc.getTeachername());
                        	%>
                        	 <tr>
                             <th><%=rc.getUsername() %></th>
                             <td><%=rc.getGender() %></td>
                             <td><%=rc.getEmail() %></td>
                             <td><%=rc.getPhoneno() %></td>
                             <td><%=rc.getTeachername() %></td>
                             <td><%=rc.getJoiningdate() %></td>
                             <td><%=rc.getDuration() %></td>
                             <td>
                             <% if("pending".equals(rc.getStatus())){%>
                            	 <a href="#" class="btn btn-sm btn-warning">pending</a>
                            	 
                            <% }else{%>
                            	      
                            	 <%=rc.getStatus() %>
                             <%}
                             
                             
                             
                             
                             %>
                             
                             </td>
                         </tr>
                         <%
                        }
                        %>
                           
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
