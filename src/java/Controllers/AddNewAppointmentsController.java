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
@WebServlet(name = "AddNewAppointments", urlPatterns = {"/Insert-Appointment"})
public class AddNewAppointmentsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        Check Session
        HttpSession session = request.getSession();
        String privi = (String) session.getAttribute("privilages");

        if (privi == null) {

            response.sendRedirect(request.getContextPath() + "/Log-Out");

        } else {
            var testdata = DBUtil.getTestPackages();
            var maxid = DBUtil.getAppointmentMax();
            var patientdata = DBUtil.getPatientDetails();

            request.setAttribute("maxID", maxid);
            request.setAttribute("testPacks", testdata);
            request.setAttribute("patientDetails", patientdata);
            RequestDispatcher dispatcher = request.getRequestDispatcher("add-new-appointment.jsp");
            dispatcher.forward(request, response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       

    }

    
}
