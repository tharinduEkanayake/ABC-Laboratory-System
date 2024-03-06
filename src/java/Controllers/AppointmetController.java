package Controllers;

import java.io.BufferedReader;
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
@WebServlet(name = "AppointmetController", urlPatterns = {"/Appointment-List"})
public class AppointmetController extends HttpServlet {

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
                    loadAppointmentDetails(request, response);
                    break;

                case "DEL":
                    deleteAppointment(request, response);
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
                insertAppointmentDetails(request, response);
                break;

            case "TEST_LIST":
                getTestList(request, response);
                break;
        }

    }

    protected void deleteAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int a_id = Integer.parseInt(request.getParameter("id"));
        
        DBUtil.deleteAppointment(a_id);
        
        loadAppointmentDetails(request, response);

    }

    protected void getTestList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int a_id = Integer.parseInt(request.getParameter("ap_id"));

        var testList = DBUtil.getAppointmentSelectedTestDetails(a_id);

        request.setAttribute("testList", testList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("testDetailsModel.jsp");
        dispatcher.forward(request, response);
//        return "appointmentDetails";
    }

    protected void insertAppointmentDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int a_id = Integer.parseInt(request.getParameter("a_id"));
        String a_date = request.getParameter("a_date");
        String a_time = request.getParameter("a_time");
        int p_id = Integer.parseInt(request.getParameter("p_id"));
        String r_date = request.getParameter("r_date");
        String testIDs = request.getParameter("testIDs");

        DBUtil.insertAppointments(a_id, a_date, a_time, r_date, "PENDING", p_id);
//        System.out.println(request.getParameter("testIDs"));
//        System.out.println(testIDs);

//      remove the unwanted characters
        String modifiedString = testIDs.replaceAll("[\\[\\]\"]", "");

//      Create the array using the string
        String[] array = modifiedString.split(",");

        for (String value : array) {
            DBUtil.insertTestReportByFrontdesk(a_id, Integer.parseInt(value));
        }

    }

    protected void loadAppointmentDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        var appointmentData = DBUtil.getAppointmentDetails();
        request.setAttribute("Appointments", appointmentData);
        RequestDispatcher dispatcher = request.getRequestDispatcher("appointmentDetails.jsp");
        dispatcher.forward(request, response);
    }
}
