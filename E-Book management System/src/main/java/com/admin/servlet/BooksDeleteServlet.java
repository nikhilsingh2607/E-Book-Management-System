
package com.admin.servlet;

import DAO.BookDAOImpl;
import DB.DBConnector;
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
@WebServlet(name = "BooksDeleteServlet", urlPatterns = {"/BooksDeleteServlet"})
public class BooksDeleteServlet extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        try
        {
            int id = Integer.parseInt(req.getParameter("id"));
           
            BookDAOImpl dao = new BookDAOImpl(DBConnector.getConnection());
            boolean f = dao.DeleteBooks(id);
            HttpSession session = req.getSession(true);
            
            if(f)
            {
                session.setAttribute("succMsg", "Book deleted Successfully.");
                resp.sendRedirect("Admin/all_books.jsp");
            }
            else
            {
                session.setAttribute("failMsg", "Something went Wrong!");
                resp.sendRedirect("Admin/all_books.jsp");
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        } 
    }
        
    
}
