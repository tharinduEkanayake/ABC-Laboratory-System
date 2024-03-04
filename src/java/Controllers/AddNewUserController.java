
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
@WebServlet(name = "AddNewUserController", urlPatterns = {"/Insert-User"})
public class AddNewUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        check session
        HttpSession session = request.getSession();
        String privi = (String) session.getAttribute("privilages");

        if (privi != null && "ADMIN".equals(privi)) {

            int max = DBUtil.getUserMax();
            request.setAttribute("maxID", max);
            RequestDispatcher dispatcher = request.getRequestDispatcher("add-new-user-form.jsp");
            dispatcher.forward(request, response);

        } else {

            response.sendRedirect(request.getContextPath() + "/Log-Out");

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
