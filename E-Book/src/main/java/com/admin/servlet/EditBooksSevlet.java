
package com.admin.servlet;

import DAO.BookDAOImpl;
import DB.DBConnector;
import dto.BookDtlsDTO;
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
 * @author nikhi
 */
@WebServlet(name = "EditBooksSevlet", urlPatterns = {"/EditBooksSevlet"})
public class EditBooksSevlet extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
         try
         {
             int id = Integer.parseInt(req.getParameter("id"));
             String bookName = req.getParameter("bname");
             String author = req.getParameter("author");
             String price = req.getParameter("price");
             String status = req.getParameter("status");
             
             BookDtlsDTO b = new BookDtlsDTO();
             b.setBookId(id);
             b.setBookName(bookName);
             b.setAuthor(author);
             b.setPrice(price);
             b.setStatus(status);
             
             BookDAOImpl dao = new BookDAOImpl(DBConnector.getConnection());
             boolean f = dao.UpdateEditBooks(b);
             
             HttpSession session = req.getSession(true);
             if(f)
             {
                 session.setAttribute("succMsg", "Book Updated Successfully.");
                 resp.sendRedirect("Admin/all_books.jsp");
             }
             else
             {
                 session.setAttribute("failMsg", "Something went wrong.");
                 resp.sendRedirect("all_books.jsp");
             }
         }
         catch(Exception e)
         {
             System.out.println(e);
         }
    }
    
}
