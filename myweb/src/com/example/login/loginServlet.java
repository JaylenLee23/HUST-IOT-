package com.example.login;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminname = request.getParameter("adminname");
        String password = request.getParameter("password");


        if ("admin".equals(adminname) && "123456".equals(password)) {
            request.getSession().setAttribute("adminname", adminname);
            response.sendRedirect("welcome.jsp");
        } else {
            response.sendRedirect("login.html?error=true");
        }
    }
}