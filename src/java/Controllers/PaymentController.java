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
@WebServlet(name = "PaymentController", urlPatterns = {"/Payments"})
public class PaymentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String command = request.getParameter("command");

        switch (command) {
            case "LOAD":
                loadPaymentsList(request, response);
                break;
            case "UPDATE":
                loadDataForUpdate(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String command = request.getParameter("command");

        switch (command) {
            case "UPDATEONE":
                insertPayment(request, response);
                break;

        }

    }

    protected void insertPayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int p_id = Integer.parseInt(request.getParameter("p_id"));
        double amount = Double.parseDouble(request.getParameter("total"));
        String p_method = request.getParameter("p_type");
        String p_date = request.getParameter("p_date");
        int a_id = Integer.parseInt(request.getParameter("a_id"));
        
        DBUtil.insertPayment(p_id, amount, p_method, p_date, a_id);
        DBUtil.updateAppointmentStatus(a_id);
        
        loadPaymentsList(request, response);

//        pay_id,total_value,pay_method,pay_date,pay_status,appointment_id
    }

    protected void loadDataForUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int tr_id = Integer.parseInt(request.getParameter("id"));

        var paymentData = DBUtil.getOneTestReport(tr_id);
        var max_id = DBUtil.getPaymentMax();

        request.setAttribute("max", max_id);
        request.setAttribute("PaymentData", paymentData);

        RequestDispatcher dispatcher = request.getRequestDispatcher("update-payment.jsp");
        dispatcher.forward(request, response);
    }

    protected void loadPaymentsList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        var paymentList = DBUtil.getPendingPaymentList();

        request.setAttribute("paymentList", paymentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("payments-list.jsp");
        dispatcher.forward(request, response);
    }

}
