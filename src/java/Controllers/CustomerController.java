
package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tharindu Konesh
 */
@WebServlet(name = "CustomerController", urlPatterns = {"/Customer-Details"})
public class CustomerController extends HttpServlet {

    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String command = request.getParameter("command");
//        System.out.println(command);
        
        switch(command){
            case "LOAD":
                var patirntDetails = DBUtil.getPatientDetails();
                request.setAttribute("patientDtailsList",patirntDetails);
                break;
                
            case "UPDATE":
                System.out.println("Update");
                break;
            case "DEL":
                System.out.println("Delete");
                break;
        }
       
        RequestDispatcher dispatcher = request.getRequestDispatcher("patientDetails.jsp");
        dispatcher.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
}
