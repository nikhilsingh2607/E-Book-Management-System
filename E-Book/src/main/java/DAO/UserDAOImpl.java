
package DAO;

import DB.DBConnector;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author nikhil
 */
public class UserDAOImpl implements UserDAO 
{
    private Connection con;

    public UserDAOImpl(Connection con)
    {
        super();
        this.con = con;
    }
   
    public boolean userRegistration(UserDTO user) 
    {
        boolean f =false;
        try
        {
            String query="INSERT INTO user(name,email,phone,password) values(?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());
            
           int i = ps.executeUpdate();
           if(i==1)
           {
               f=true;
           }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return f;
    }
    
    
    public UserDTO login(String email, String password) 
    {
        UserDTO user = null;
        try
        {
        String query = "SELECT * FROM user WHERE email='"+email+"' AND password='"+password+"';";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        while(rs.next())
        {
            user = new UserDTO();
            
            user.setId(rs.getInt(1));
            user.setName(rs.getString(2));
            user.setEmail(rs.getString(3));
            user.setPhone(rs.getString(4));
            user.setPassword(rs.getString(5));
            user.setAddress(rs.getString(6));
            user.setLandmark(rs.getString(7));
            user.setCity(rs.getString(8));
            user.setState(rs.getString(9));
            user.setPincode(rs.getString(10));
            
        }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        System.out.println("ananana");
        return user;
    }
    
    @Override
    public String checkPassword(int userId) 
    {
     
        String tablePass=null;
        try
        {
            String query = "SELECT password FROM user WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,userId);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                tablePass=rs.getString(1);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return tablePass;
    }
    @Override
    public boolean updateProfile(UserDTO user)
    {
        boolean f = false;
        
        try
        {
            String query = "UPDATE user SET name=?,email=?,phone=?,password=? WHERE id=?;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4,user.getPassword());
            ps.setInt(5, user.getId());
            
            int i = ps.executeUpdate();
            if(i==1)
                f=true;
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return f;
    }

    @Override
    public boolean checkUser(String email) 
    {
        boolean f =true;
        
        try
        {
            String query = "SELECT email FROM user WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,email);
                        
            ResultSet rs  = ps.executeQuery();
            if(rs.next())
                f=false;
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return f;
    }

    
}
