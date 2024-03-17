package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "ReportController", urlPatterns = {"/Reports"})
public class ReportController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String command = request.getParameter("command");

        switch (command) {
            case "LOAD":
                loadReportList(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected void loadReportList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        var todayAppointment = DBUtil.getTodayAppointmnets();
        var todayIncome = DBUtil.getTodayIncome();
        var totalCustomers = DBUtil.getTotalCustomers();
        var totalTest = DBUtil.getTotalTest();
        
        //daily income chart data
        var dailyTotal = DBUtil.getDilyIncome();
        List<String> p_date = new ArrayList<>();
        List<Double> amount = new ArrayList<>();
        
        for(var item : dailyTotal){
            p_date.add("'" + item.getDate() +"'");
            amount.add(item.getTotal());
        }
        
        request.setAttribute("dateList", p_date);
        request.setAttribute("amountList", amount);
        
        
        //chart total test summary
        var todatCompleTets = DBUtil.getTodayCompleteTest();
        List<Integer> noOfTest = new ArrayList<>();
        List<String> testName = new ArrayList<>();
        
        for(var item : todatCompleTets){
            noOfTest.add(item.getNoOfTests());
            testName.add("'" + item.getTestname() + "'");
        }
                
        request.setAttribute("noOfTest", noOfTest);
        request.setAttribute("testName", testName);

        
        request.setAttribute("totalTest", totalTest);
        request.setAttribute("totalCustomers", totalCustomers);
        request.setAttribute("todayIncome", todayIncome);
        request.setAttribute("todayAppointment", todayAppointment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("report-list.jsp");
        dispatcher.forward(request, response);

    }

}
