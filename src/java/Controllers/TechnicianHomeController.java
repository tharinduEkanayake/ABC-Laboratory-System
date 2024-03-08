
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
@WebServlet(name = "TechnicianHomeController", urlPatterns = {"/Technician-Home"})
public class TechnicianHomeController extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String command = request.getParameter("command");
        
        switch(command){
            case "LOAD":
                loadPendingAppointmnet(request,response);
                break;
        }
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    protected void loadPendingAppointmnet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        var appointmentList = DBUtil.getPendingAppointment();
        
        request.setAttribute("a_list", appointmentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("technician-home.jsp");
        dispatcher.forward(request, response);        
    }

}
