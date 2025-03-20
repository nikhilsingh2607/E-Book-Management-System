
package DAO;

import dto.BookDtlsDTO;
import dto.CartDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nikhil
 */
public class CartDAOImpl implements CartDAO 
{
    private Connection con ;
    
   public CartDAOImpl(Connection con)
    {
        this.con = con;
    }
    
    @Override
    public boolean addCart(CartDTO c) 
    {
        boolean f = false;
        try
        {
            String query = "INSERT INTO cart(bId,uId,bookName,author,price,total_price) values(?,?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, c.getBookId());
            ps.setInt(2, c.getUserId());
            ps.setString(3, c.getBookName());
            ps.setString(4, c.getAuthor());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getTotalPrice());
            
            int i = ps.executeUpdate();
            if(i==1)
            {
                f = true;
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return f;
    }

    @Override
    public List<CartDTO> getBookByUser(int userId) 
    {
      List<CartDTO> list = new ArrayList<CartDTO>();
      double totalPrice=0;
      try
      {
          String query = "SELECT * FROM cart Where uId=?;";
          PreparedStatement ps = con.prepareStatement(query);
          ps.setInt(1,userId);
          
          ResultSet rs = ps.executeQuery();
          
          while(rs.next())
          {            
              CartDTO c = new CartDTO();
              c.setCartId(rs.getInt(1));
              c.setBookId(rs.getInt(2));
              c.setUserId(rs.getInt(3));
              c.setBookName(rs.getString(4));
              c.setAuthor(rs.getString(5));
              c.setPrice(rs.getDouble(6));
              
              totalPrice = totalPrice+rs.getDouble(7);
              c.setTotalPrice(totalPrice);
              list.add(c);
          }
      }
      catch(SQLException e)
      {
          System.out.println(e);
      }
       return list;
    }
    
    public boolean deleteBook(int cartId, int bookId , int userId) 
    {
        boolean f = false;
        
        try
        {
          String query = "DELETE FROM cart WHERE bId=? AND uId=? AND cId=?;";
          PreparedStatement ps = con.prepareStatement(query);
          ps.setInt(1,bookId);
          ps.setInt(2,userId);
          ps.setInt(3, cartId);
          int i = ps.executeUpdate();
         if(i==1)
         {
             f=true;
         }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return f;
    }
}
