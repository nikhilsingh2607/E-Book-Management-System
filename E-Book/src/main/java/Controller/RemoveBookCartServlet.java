
package Controller;

import DAO.CartDAOImpl;
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
@WebServlet(name = "RemoveBookCartServlet", urlPatterns = {"/RemoveBookCartServlet"})
public class RemoveBookCartServlet extends HttpServlet
{
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        int bookId = Integer.parseInt(req.getParameter("bId"));
        int userId = Integer.parseInt(req.getParameter("uId"));
        int cartId = Integer.parseInt(req.getParameter("cId"));
         CartDAOImpl dao = new CartDAOImpl(DBConnector.getConnection());
         boolean f = dao.deleteBook(cartId,bookId,userId);
         
         HttpSession session = req.getSession(true);
         
         if(f)
         {
             session.setAttribute("succMsg", "Book removed From Cart");
             resp.sendRedirect("checkout.jsp");
         }
         else
         {
             session.setAttribute("failedMsg","Something Went Wrong");
             resp.sendRedirect("checkout.jsp");
         }
    }
    
}
