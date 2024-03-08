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
@WebServlet(name = "AddTestReportDetailsController", urlPatterns = {"/Add-Test-Report-Details"})
public class AddTestReportDetailsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        
        request.setAttribute("tr_id", id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("add-test-report-details.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        int t_id = (int) session.getAttribute("logingID");
        
        int tr_id = Integer.parseInt(request.getParameter("rp_id"));
        String t_time = request.getParameter("t_time");
        String report_data = request.getParameter("r_data");
        
        DBUtil.updateTestReportDetails(tr_id,t_time,report_data,t_id);
        
        response.sendRedirect(request.getContextPath() + "/Technician-Home?id=" + t_id + "&command=LOAD");
        
//        request.setAttribute("command", "LOAD");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("Technician-Home");
//        dispatcher.forward(request, response);

    }

}
