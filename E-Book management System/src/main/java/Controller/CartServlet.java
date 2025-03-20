package Controller;

import DAO.BookDAOImpl;
import DAO.CartDAOImpl;
import DB.DBConnector;
import dto.BookDtlsDTO;
import dto.CartDTO;
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
@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
       try
       {
        int bookId = Integer.parseInt(req.getParameter("bid"));
        int userId = Integer.parseInt(req.getParameter("uid"));
        
        BookDAOImpl dao = new BookDAOImpl(DBConnector.getConnection());
        BookDtlsDTO b = dao.getBookById(bookId);
        
        CartDTO c = new CartDTO();
        c.setBookId(bookId);
        c.setUserId(userId);
        c.setBookName(b.getBookName());
        c.setAuthor(b.getAuthor());
        c.setPrice(Double.parseDouble(b.getPrice()));
        c.setTotalPrice(Double.parseDouble(b.getPrice()));
        
        CartDAOImpl dao1 = new CartDAOImpl(DBConnector.getConnection());
        boolean f = dao1.addCart(c);
        
        HttpSession session = req.getSession(true);
        
        if(f)
        {
            session.setAttribute("addCart" , "Book Added to Cart!");
            resp.sendRedirect("all_new_book.jsp");
        }
        else
        {
            session.setAttribute("failed", "Something went wrong");
            resp.sendRedirect("all_new_book.jsp");
        }
       }
       catch(Exception e)
       {
           System.out.print(e);
       }
    }
        
}
