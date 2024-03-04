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
@WebServlet(name = "CustomerController", urlPatterns = {"/Customer-Details"})
public class CustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        Check Session
        HttpSession session = request.getSession();
        String privi = (String) session.getAttribute("privilages");

        if (privi == null) {
            
            response.sendRedirect(request.getContextPath() + "/Log-Out");
            
        } else {
            
            String command = request.getParameter("command");

            switch (command) {
                case "LOAD":
                    loadCustomerData(request, response);
                    break;
                case "UPDATE":
                    System.out.println("Update");
                    break;
                case "DEL":
                    System.out.println("Delete");
                    break;
            }
        }
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String command = request.getParameter("command");

        switch (command) {
            case "ADD":
                insertCustomerData(request, response);
                break;
        }

//        System.out.println(command);
    }

//  Insert the customer data to the table
    void insertCustomerData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int p_id = Integer.parseInt(request.getParameter("p_id"));
        String p_name = request.getParameter("p_name");
        String p_gender = request.getParameter("p_gender");
        String p_address = request.getParameter("p_address");
        String p_birthday = request.getParameter("p_birthday");
        String p_email = request.getParameter("p_email");
        String p_phone = request.getParameter("p_phone");
        String p_password = request.getParameter("p_password");
        String p_privileges = request.getParameter("p_privileges");
        String p_register_date = request.getParameter("p_register_date");
//        
//        System.out.println(p_id + " " + p_name + " " + p_gender + " " + p_address + " " + p_birthday + " " + p_email + " " + p_phone + " " + p_password + " " + p_privileges + " " + p_register_date);

        DBUtil.insertCustomerDetails(p_id, p_name, p_gender, p_address, p_birthday, p_email, p_phone, p_password, p_privileges, p_register_date);

        loadCustomerData(request, response);
    }

//  Load the all of customer data to the table
    void loadCustomerData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        var patirntDetails = DBUtil.getPatientDetails();
        request.setAttribute("patientDtailsList", patirntDetails);
        RequestDispatcher dispatcher = request.getRequestDispatcher("patientDetails.jsp");
        dispatcher.forward(request, response);

    }
}
