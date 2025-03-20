package Controller;

import DAO.UserDAOImpl;
import DB.DBConnector;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nikhil
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmpass");
        String check = req.getParameter("check");

        HttpSession session = req.getSession(true);
        
        if(!password.equals(confirmPassword))
        {
            session.setAttribute("failedMsg", "Password Doesn't Match");
            resp.sendRedirect("registration.jsp");
        }
        else
        {
        UserDTO user = new UserDTO();
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);


        if (check != null) {
            UserDAOImpl dao = new UserDAOImpl(DBConnector.getConnection());

            if (dao.checkUser(email)) {
                if (dao.userRegistration(user)) {
                    session.setAttribute("succMsg", "Registration Done Successfully !");
                    resp.sendRedirect("registration.jsp");
                } else {
                    session.setAttribute("failedMsg", "Registration Failed !");
                    resp.sendRedirect("registration.jsp");
                }
            }
            else{
                session.setAttribute("failedMsg", "User Already Exist, Try with another email.");
                    resp.sendRedirect("registration.jsp");
            }
        } else {
//            System.out.println("Please Check Terms And Conditions.");
            session.setAttribute("failedMsg", "please check agree Terms and Conditions");
            resp.sendRedirect("registration.jsp");
        }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("registration.jsp");
    }
}
