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
@WebServlet(name = "UpdateUsersController", urlPatterns = {"/Update-Users"})
public class UpdateUsersController extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String privi = (String) session.getAttribute("privilages");

        if (privi != null && "ADMIN".equals(privi)) {

            int u_id = Integer.parseInt(request.getParameter("id"));
            var user = DBUtil.getOneUser(u_id);
            
            request.setAttribute("User", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("update-users-form.jsp");
            dispatcher.forward(request, response);

        } else {

            response.sendRedirect(request.getContextPath() + "/Log-Out");

        }
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    

}
