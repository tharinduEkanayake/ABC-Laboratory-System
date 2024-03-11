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
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uname = request.getParameter("username");
        String passw = request.getParameter("password");

        //call the database
        var loginUserDetails = DBUtil.getLoginDetails(uname, passw);

        if (loginUserDetails != null) {

            String privi = loginUserDetails.getPrivilages();
            int logID = loginUserDetails.getId();

//            Session part
            HttpSession session = request.getSession();
            session.setAttribute("privilages", privi);
            session.setAttribute("logingID", logID);
            

//            System.out.println("ID is : " + loginUserDetails.getId() + "  privilages is " + loginUserDetails.getPrivilages());
            switch (privi) {
                case "PATIENT":
                    response.sendRedirect(request.getContextPath() + "/Test_report_details?id=" + logID + "&command=LOAD");
                    break;

                case "ADMIN":
                    response.sendRedirect(request.getContextPath() + "/Admin-Home");
                    break;

                case "TECH":
                    response.sendRedirect(request.getContextPath() + "/Technician-Home?id=" + logID + "&command=LOAD");
                    break;

                case "FDESK":
                    response.sendRedirect(request.getContextPath() + "/FrontDesk-Home?id=" + logID + "&type=" + privi);
                    break;
            }

        } else {

            request.setAttribute("LoginResponse", "No_Login");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
//            System.out.println("NO Login");
//            if (loginUserDetails.getPrivilages().equals("PATIENT")) {
//
//                System.out.print("ID is : " + loginUserDetails.getId() + "  privilages is " + loginUserDetails.getPrivilages());
//
//            } else if (loginUserDetails.getPrivilages().equals("USER")) {
//
//            } else if (loginUserDetails.getPrivilages().equals("ADMIN")) {
//
//            } else if (loginUserDetails.getPrivilages().equals("TECHNI")) {
//
//            }
        }

//        request.setAttribute("loginUserData", loginUserDetails);
//        request.setAttribute("loginUserData", "error");
//        System.out.print("ID is : " + loginUserDetails.getId() +"  privilages is " + loginUserDetails.getPrivilages());
//        System.out.print(loginUserDetails.getUsername());
//        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
//        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
