
package DAO;

import dto.BookOrderDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nikhi
 */
public class BookOrderDAOImpl implements BookOrderDAO
{
      private Connection con = null;
      
      public BookOrderDAOImpl(Connection con)
      {
          super();
          this.con = con;
      }

    @Override
    public boolean saveOrder(List<BookOrderDTO> blist) 
    {
        boolean f = false;
        
        try
        {
            String query = "INSERT INTO book_order(order_id,user_name,email,address,phone,book_name,author,price,payment) values(?,?,?,?,?,?,?,?,?) ;";
            
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement(query);
            
            for(BookOrderDTO b: blist)
            {
                ps.setString(1,b.getOrderId() );
                ps.setString(2, b.getUserName());
                ps.setString(3, b.getEmail());
                ps.setString(4, b.getFullAddress());
                ps.setString(5, b.getPhone());
                ps.setString(6, b.getBookName());
                ps.setString(7, b.getAuthor());
                ps.setString(8, b.getPrice());
                ps.setString(9, b.getPaymentType());
                
                ps.addBatch();
            }
            int[] count = ps.executeBatch();
            con.commit();
            f=true;
            con.setAutoCommit(true);
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return f;
    }

    @Override
    public List<BookOrderDTO> getBook(String email)
    {
        List<BookOrderDTO> list = new ArrayList<BookOrderDTO>();
        BookOrderDTO o =null;
        try
        {
            String query = "SELECT * FROM book_order WHERE email=?;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                o = new BookOrderDTO();
                o.setId(rs.getInt(1));
                o.setOrderId(rs.getString(2));
                o.setUserName(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setFullAddress(rs.getString(5));
                o.setPhone(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPaymentType(rs.getString(10));
                
                list.add(o);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return list;
    }

    @Override
    public List<BookOrderDTO> getAllOrder()
    {
        List<BookOrderDTO> list = new ArrayList<BookOrderDTO>();
        BookOrderDTO o =null;
        try
        {
            String query = "SELECT * FROM book_order ;";
            PreparedStatement ps = con.prepareStatement(query);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                o = new BookOrderDTO();
                o.setId(rs.getInt(1));
                o.setOrderId(rs.getString(2));
                o.setUserName(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setFullAddress(rs.getString(5));
                o.setPhone(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPaymentType(rs.getString(10));
                
                list.add(o);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return list;
    }
}
