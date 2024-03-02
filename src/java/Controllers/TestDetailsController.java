package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TestDetailsController", urlPatterns = {"/Test-Details"})
public class TestDetailsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String command = request.getParameter("command");

        switch (command) {
            case "LOAD":
                var testsDetails = DBUtil.getTestPackages();
                request.setAttribute("testDetailsList",testsDetails);
                break;
            case "UPDATE":
                System.out.println("Update");
                break;
            case "DEL":
                System.out.println("Delete");
                break;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("testPackages.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
