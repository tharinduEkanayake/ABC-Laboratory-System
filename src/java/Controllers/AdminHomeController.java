
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
@WebServlet(name = "AdminHomeController", urlPatterns = {"/Admin-Home"})
public class AdminHomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        session part
        HttpSession session = request.getSession();
        String privi = (String) session.getAttribute("privilages");

        if (privi != null && "ADMIN".equals(privi)) {

            RequestDispatcher dispatcher = request.getRequestDispatcher("admin-home.jsp");
            dispatcher.forward(request, response);

        } else if (privi != null && "FDESK".equals(privi)) {

            response.sendRedirect(request.getContextPath() + "/FrontDesk-Home");

        } else {
            response.sendRedirect(request.getContextPath() + "/Log-Out");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    
}
