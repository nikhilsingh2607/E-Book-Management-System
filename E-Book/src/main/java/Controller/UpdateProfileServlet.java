package Controller;

import DAO.UserDAOImpl;
import DB.DBConnector;
import dto.UserDTO;
import java.io.IOException;
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
@WebServlet(name = "UpdateProfileServlet", urlPatterns = {"/UpdateProfileServlet"})
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);

        int userId = Integer.parseInt(req.getParameter("userId"));
//        System.out.println("zzzzzzzzzzzzzzzzzzzzz");
        String userName = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        UserDTO user = new UserDTO();
        user.setId(userId);
        user.setName(userName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(oldPassword);

        UserDAOImpl dao = new UserDAOImpl(DBConnector.getConnection());

        String tablePass = dao.checkPassword(userId);
        if (tablePass.equals(oldPassword)) {
            boolean f = dao.updateProfile(user);

            if (f) {
                session.setAttribute("succMsg1", "Profile Updated Please Login Again!");
                resp.sendRedirect("edit_profile.jsp");
            } else {
                session.setAttribute("failedMsg1", "Something went wrong");
                resp.sendRedirect("edit_profile.jsp");
            }
        } else {
            session.setAttribute("failedMsg1", "Old Password Doesn't Match!");
            resp.sendRedirect("edit_profile.jsp");
        }
    }

}
