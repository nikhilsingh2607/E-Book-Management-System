package Controller;

import DAO.BookDAOImpl;
import DB.DBConnector;
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
@WebServlet(name = "DeleteOldBookServlet", urlPatterns = {"/DeleteOldBookServlet"})
public class DeleteOldBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        String email = req.getParameter("email");
        System.out.println(email);
        int bookId = Integer.parseInt(req.getParameter("bId"));
        System.out.println(bookId+" "+email);
        try {
            BookDAOImpl dao = new BookDAOImpl(DBConnector.getConnection());
            boolean f = dao.oldBookDelete(bookId, email);
            if (f) {
                session.setAttribute("succMsg", "Old Book Deleted Successfully!");
                resp.sendRedirect("old_book.jsp");
            } else {
                session.setAttribute("failedMsg", "Something Went Wrong!");
                resp.sendRedirect("old_book.jsp");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
