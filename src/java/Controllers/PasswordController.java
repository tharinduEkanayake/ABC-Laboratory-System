/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tharindu Konesh
 */
@WebServlet(name = "PasswordController", urlPatterns = {"/Password"})
public class PasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String command = request.getParameter("command");
        switch (command) {
            case "LOAD":
                loadUserdata(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String command = request.getParameter("command");

        switch (command) {
            case "UPDATE":
                updatePassword(request, response);
//                System.out.println(request.getParameter("pass"));
                break;
        }

    }

    protected void updatePassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String privi = (String) session.getAttribute("privilages");
        int log_id = (int) session.getAttribute("logingID");

        String pass = request.getParameter("pass");

        if ("PATIENT".equals(privi)) {
            DBUtil.updateCustomerPassword(log_id, pass);

        } else {
            DBUtil.updateUserPassword(log_id, pass);
        }

    }

    protected void loadUserdata(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int log_id = (int) session.getAttribute("logingID");

        request.setAttribute("l_id", log_id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("password-changing.jsp");
        dispatcher.forward(request, response);
    }

}
