/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAOImpl;
import DB.DBConnector;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        try
        { 
            UserDAOImpl dao = new UserDAOImpl(DBConnector.getConnection());
            HttpSession session = request.getSession(true);
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            // For ADMIN
            if("admin@gmail.com".equals(email) && "adminPass".equals(password))
            {
                UserDTO user = new UserDTO();
                user.setName("Admin");
                session.setAttribute("userobj", user);
                response.sendRedirect("Admin/Home.jsp");
            }
            //for USERS
            else 
            {
                UserDTO user = dao.login(email, password);
                if(user!=null)
                {
                    session.setAttribute("userobj" , user);
                    response.sendRedirect("index.jsp");
                }
                else
                {
                    session.setAttribute("failedMsg", "Invalid Email or Password");
                    response.sendRedirect("login.jsp");
                }
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.sendRedirect("login.jsp");
    }

}
