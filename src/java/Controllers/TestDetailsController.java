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

@WebServlet(name = "TestDetailsController", urlPatterns = {"/Test-Details"})
public class TestDetailsController extends HttpServlet {

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
                    loadTestDetails(request, response);
                    break;
                case "UPDATE":
                    System.out.println("Update");
                    break;
                case "DEL":
                    deleteTesPackage(request,response);
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
                addTestDetails(request,response);
                break;
                
            case "UPDATE":
                updateTestDetails(request,response);
                break;
                
        }
    }
    
//    Delete Test package
    protected void deleteTesPackage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int t_id = Integer.parseInt(request.getParameter("id"));
        
        DBUtil.deleteTets(t_id);
        
        loadTestDetails(request, response); 
    }
    
    
//    update test packages details
    protected void updateTestDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int t_id = Integer.parseInt(request.getParameter("t_id"));
        double charges = Double.parseDouble(request.getParameter("charges"));
        String references_level = request.getParameter("references_level");
        
        DBUtil.updateTestDetails(t_id,charges,references_level);
        
        loadTestDetails(request, response); 
        
    }

//    Custome created methods
    protected void addTestDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int t_id = Integer.parseInt(request.getParameter("t_id"));
        String t_name = request.getParameter("t_name");
        double charges = Double.parseDouble(request.getParameter("charges"));
        String references_level = request.getParameter("references_level");
        
        DBUtil.inserTestDetails(t_id,t_name,charges,references_level);
        
        loadTestDetails(request, response);        
    }

    protected void loadTestDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        var testsDetails = DBUtil.getTestPackages();
        request.setAttribute("testDetailsList", testsDetails);
        RequestDispatcher dispatcher = request.getRequestDispatcher("testPackages.jsp");
        dispatcher.forward(request, response);
    }

}
