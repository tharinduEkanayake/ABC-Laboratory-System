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
@WebServlet(name = "UserController", urlPatterns = {"/User-Details"})
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        Check Session
        HttpSession session = request.getSession();
        String privi = (String) session.getAttribute("privilages");

        if (privi != null && "ADMIN".equals(privi)) {
            
            String command = request.getParameter("command");

            switch (command) {
                case "LOAD":
                    loadUserData(request, response);
                    break;
            }
            
        } else {
            
            response.sendRedirect(request.getContextPath() + "/Log-Out");

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String command = request.getParameter("command");

        switch (command) {
            case "ADD":
                insertUserData(request, response);
                break;
        }

    }

//    Custome created method list
    protected void insertUserData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int u_id = Integer.parseInt(request.getParameter("u_id"));
        String u_first_name = request.getParameter("u_first_name");
        String u_last_name = request.getParameter("u_last_name");
        String u_address = request.getParameter("u_address");
        String u_gender = request.getParameter("u_gender");
        String u_email = request.getParameter("u_email");
        String u_phone = request.getParameter("u_phone");
        String u_password = request.getParameter("u_password");
        String u_privileges = request.getParameter("u_privileges");
        String u_registered_date = request.getParameter("u_registered_date");

//        System.out.println(u_id + " " + u_first_name + " " + u_last_name + " " + u_address + " " + u_gender + " " + u_email + " " + u_phone + " " + u_password + " " + u_privileges + " " + u_registered_date);
        DBUtil.insertUserDetails(u_id, u_first_name, u_last_name, u_address, u_gender, u_email, u_phone, u_password, u_privileges, u_registered_date);

        loadUserData(request, response);
    }

    protected void loadUserData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        var usersList = DBUtil.getUsersList();
        request.setAttribute("usersList", usersList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("usersDetails.jsp");
        dispatcher.forward(request, response);

    }

}
