
package Controller;

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
@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        try
        {
            HttpSession session = req.getSession(true);
            session.removeAttribute("userobj");
//            session.invalidate();

            // for logout message .
            HttpSession session1 = req.getSession(true);
            session.setAttribute("succMsg", "Logout Successfully");
            resp.sendRedirect("login.jsp");
            
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }
    
}
