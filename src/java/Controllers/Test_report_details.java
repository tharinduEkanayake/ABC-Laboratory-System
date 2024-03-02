package Controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Test_report_details", urlPatterns = {"/Test_report_details"})
public class Test_report_details extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       

        String parameterValue = request.getParameter("id");
//        System.out.println(parameterValue);
        
        int pati_id = Integer.parseInt(parameterValue);
        var reportDetails = DBUtil.getTestReportList(pati_id);
        
        
//        System.out.println(reportDetails);
        
        request.setAttribute("patientReportDetais", reportDetails);
        RequestDispatcher dispatcher = request.getRequestDispatcher("patient_home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    
}
