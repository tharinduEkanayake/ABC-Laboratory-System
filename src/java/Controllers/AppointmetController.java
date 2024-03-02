
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
@WebServlet(name = "AppointmetController", urlPatterns = {"/Appointment-List"})
public class AppointmetController extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String command = request.getParameter("command");
        
        switch (command){
            case "LOAD":
                var appointmentData = DBUtil.getAppointmentDetails();
                request.setAttribute("Appointments", appointmentData);
                break;
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("appointmentDetails.jsp");
        dispatcher.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    

}
