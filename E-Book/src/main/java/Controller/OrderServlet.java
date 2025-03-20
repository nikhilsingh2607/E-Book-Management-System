
package Controller;

import DAO.BookOrderDAOImpl;
import DAO.CartDAOImpl;
import DB.DBConnector;
import dto.BookOrderDTO;
import dto.CartDTO;
import dto.UserDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nikhi
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet"})
public class OrderServlet extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        try
        {
            int userId = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String address = req.getParameter("address");
            String landmark = req.getParameter("landmark");
            String state = req.getParameter("state");
            String city = req.getParameter("city");
            String pincode = req.getParameter("pincode");
            String paymentType = req.getParameter("payment");
            
            String fullAddress =address+","+landmark+","+city+","+state+","+pincode; 
            
            HttpSession session = req.getSession(true);
            
            System.out.println(paymentType);
            CartDAOImpl dao = new CartDAOImpl(DBConnector.getConnection());
            
            List<CartDTO> blist = dao.getBookByUser(userId);
            
            if(blist.isEmpty())
            {
             session.setAttribute("failedMsg","Cart is Empty!");
                resp.sendRedirect("checkout.jsp");
            }
            else
            {
            BookOrderDAOImpl dao2 = new BookOrderDAOImpl(DBConnector.getConnection());
                        
            BookOrderDTO o = null;
            
            ArrayList<BookOrderDTO> orderList = new ArrayList<BookOrderDTO>();
            Random r = new Random ();
            for(CartDTO c :blist)
            {
                o = new BookOrderDTO();
                o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
                o.setUserName(name);
                o.setEmail(email);
                o.setPhone(phone);
                o.setFullAddress(fullAddress);
                o.setBookName(c.getBookName());
                o.setAuthor(c.getAuthor());
                o.setPrice(c.getPrice()+"");
                o.setPaymentType(paymentType);
                orderList.add(o);
                
            }
            
            if("noselect".equals(paymentType))
            {
                session.setAttribute("failedMsg", "Please select Payment Type!");
                resp.sendRedirect("checkout.jsp");
            }
            else
            {
                boolean f = dao2.saveOrder(orderList);
                if(f)
                {
                resp.sendRedirect("order_success.jsp");
                }
                else
                {
                session.setAttribute("failedMsg", "Your Order doesn't placed.");
                resp.sendRedirect("checkout.jsp");  
                }
            }
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }
    
}
