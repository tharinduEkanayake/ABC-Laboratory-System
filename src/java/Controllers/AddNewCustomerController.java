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
@WebServlet(name = "AddNewCustomerController", urlPatterns = {"/Insert-Customer"})
public class AddNewCustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        check session
        HttpSession session = request.getSession();
        String privi = (String) session.getAttribute("privilages");

        if (privi == null) {

            response.sendRedirect(request.getContextPath() + "/Log-Out");

        } else {

            int maxId = DBUtil.getCustomerMax();
            request.setAttribute("MaxID", maxId);
            RequestDispatcher dispatcher = request.getRequestDispatcher("add-new-customer-form.jsp");
            dispatcher.forward(request, response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
