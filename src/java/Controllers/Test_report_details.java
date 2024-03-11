package Controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Test_report_details", urlPatterns = {"/Test_report_details"})
public class Test_report_details extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        HttpSession session = request.getSession();
        String privi = (String) session.getAttribute("privilages");
        
        if (privi == null) {
            
            response.sendRedirect(request.getContextPath() + "/Log-Out");
            
        } else {
            String command = request.getParameter("command");
            
            switch (command) {
                case "LOAD":
                    loadTestReportDetails(request, response);
                    break;
            }
        }       

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    
    
    
    protected void loadTestReportDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        dont asign the id parameter for the url id


//        int pati_id = Integer.parseInt(request.getParameter("id"));
//        var reportDetails = DBUtil.getTestReportList(pati_id);
        
        
//        System.out.println(reportDetails);
        
//        request.setAttribute("patientReportDetais", reportDetails);
        RequestDispatcher dispatcher = request.getRequestDispatcher("patient_home.jsp");
        dispatcher.forward(request, response);
        
    }

    
}
