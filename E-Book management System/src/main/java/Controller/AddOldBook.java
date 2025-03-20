
package com.admin.servlet;

import DAO.BookDAOImpl;
import DB.DBConnector;
import dto.BookDtlsDTO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author nikhil
 */
@WebServlet(name = "AddOldBook", urlPatterns = {"/AddOldBook"})
@MultipartConfig // for reciving files like img . 
public class AddOldBook extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        try
        {
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String categories = "OldBook";
            String status = "Active";
            String email =req.getParameter("email") ;
            Part part = req.getPart("bimg"); // used to get files.(Photo of book) 
            String fileName = part.getSubmittedFileName(); // filename to store in database
            BookDtlsDTO b = new BookDtlsDTO(bookName,author,price,categories,status,fileName,email );
            
            BookDAOImpl dao = new BookDAOImpl(DBConnector.getConnection());
            
            
            boolean f = dao.addBooks(b);
            
            HttpSession session = req.getSession(true);
            
            if(f)
            {
                // storing path of project in path variable and append it with book-img folder name to storing the path of book-img folder.
                String path = getServletContext().getRealPath("") + "book-img";
            
                File file = new File(path);
                // storing(write) the img of that book which is passed by user into the book-img folder.
                part.write(path + File.separator + fileName);
                
                session.setAttribute("succMsg","Book Add Sucessfully");
                resp.sendRedirect("sell_book.jsp");
            }
            else
            {
                session.setAttribute("failedMsg", "Something went wrong");
                resp.sendRedirect("sell_book.jsp");
            }
        }
        catch(Exception e)
        {}
    }
}
