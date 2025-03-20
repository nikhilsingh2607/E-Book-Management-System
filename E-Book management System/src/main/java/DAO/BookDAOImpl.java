
package DAO;

import dto.BookDtlsDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nikhil
 */
public class BookDAOImpl implements BookDAO
{
    private Connection con ;

    public BookDAOImpl(Connection con) {
        this.con = con;
    }
    
    
    @Override
    public boolean addBooks(BookDtlsDTO b) 
    {
        boolean f = false;
        
        try
        {
            String query = "INSERT INTO book_dtls(bookName,author,price,bookCategory,status,photo,user_email) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, b.getBookName());;
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhotoName());
            ps.setString(7, b.getEmail());
            
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

    @Override
    public List<BookDtlsDTO> getAllBooks() 
    {
        List<BookDtlsDTO> list = new ArrayList<BookDtlsDTO>();
        BookDtlsDTO b =null;
        
        try
        {
            String query = "SELECT * FROM book_dtls";
            PreparedStatement ps = con.prepareStatement(query);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                b = new BookDtlsDTO();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public BookDtlsDTO getBookById(int id) 
    {
        BookDtlsDTO b = null;
        
        try
        {
            String query = "SELECT * FROM book_dtls WHERE bookId=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                b = new BookDtlsDTO();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
            }
        }
        catch(Exception e)
        {}
        return b;
    }

    @Override
    public boolean UpdateEditBooks(BookDtlsDTO b) 
    {
        boolean f = false;
        
        try{
//            HttpSession session = req
            String query = "UPDATE book_dtls SET bookName=?,author=?,price=?,status=? WHERE bookId=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5, b.getBookId());
            
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

    @Override
    public boolean DeleteBooks(int id) 
    {
        boolean f=false;
        
        try
        {
             String query = "DELETE FROM book_dtls WHERE bookId=?";
             PreparedStatement ps = con.prepareStatement(query);
             ps.setInt(1, id);
             int i = ps.executeUpdate();
             if(i==1)
             {
                 f= true;
             }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        
        return f;
    }

    @Override
    public List<BookDtlsDTO> getNewBook() 
    {
        List<BookDtlsDTO> list = new ArrayList<BookDtlsDTO>();
        BookDtlsDTO b = null ;
        try
        {
            String query = "SELECT * FROM book_dtls  where bookCategory=? and status=? ORDER BY bookId DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,"NewBook");
            ps.setString(2,"Active");
            ResultSet rs =ps.executeQuery();
            int i=1;
            while(rs.next() && i<=4)
            {
                b = new BookDtlsDTO();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                
                i++;
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public List<BookDtlsDTO> getRecentBook() 
    {
        List<BookDtlsDTO> list = new ArrayList<BookDtlsDTO>();
        
        BookDtlsDTO b = null;
        String query = "SELECT * FROM book_dtls WHERE status=? ORDER BY bookId DESC";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, "Active");
            
            ResultSet rs = ps.executeQuery();
            int i=1;
            while(rs.next() && i<=4)
            {
                b = new BookDtlsDTO();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                
                i++;
            }
        } catch (SQLException e) 
        {
            System.out.println(e);
        }
        
        
        
        
        return list;
    }

    @Override
    public List<BookDtlsDTO> getOldBook() 
    {
        List<BookDtlsDTO> list = new ArrayList<BookDtlsDTO>();
        
        BookDtlsDTO b = null;
        
        try
        {
            String query = "SELECT * FROM book_dtls WHERE status=? AND bookCategory=? ORDER BY bookId DESC;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, "Active");
            ps.setString(2, "OldBook");
            
            ResultSet rs = ps.executeQuery();
            int i =1;
            
            while(rs.next() && i<=4)
            {
                b = new BookDtlsDTO();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                
                i++;
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        
        return list;
    }

    @Override
    public List<BookDtlsDTO> getAllRecentBook()
    {
        List<BookDtlsDTO> list = new ArrayList<BookDtlsDTO>();
        
        BookDtlsDTO b = null;
        String query = "SELECT * FROM book_dtls WHERE status=? ORDER BY bookId DESC";
        try{
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1,"Active");
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
            b = new BookDtlsDTO();
            b.setBookId(rs.getInt(1));
            b.setBookName(rs.getString(2));
            b.setAuthor(rs.getString(3));
            b.setPrice(rs.getString(4));
            b.setBookCategory(rs.getString(5));
            b.setStatus(rs.getString(6));
            b.setPhotoName(rs.getString(7));
            b.setEmail(rs.getString(8));
            
            list.add(b);
        }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public List<BookDtlsDTO> getAllNewBook()
    {
        List<BookDtlsDTO> list = new ArrayList<BookDtlsDTO>();
        BookDtlsDTO b = null;
        
        try{
            String query = "SELECT * FROM book_dtls WHERE status=? AND bookCategory=? ORDER BY bookId DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,"Active");
            ps.setString(2, "NewBook");
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                b = new BookDtlsDTO();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
            b.setAuthor(rs.getString(3));
            b.setPrice(rs.getString(4));
            b.setBookCategory(rs.getString(5));
            b.setStatus(rs.getString(6));
            b.setPhotoName(rs.getString(7));
            b.setEmail(rs.getString(8));
            
            list.add(b);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public List<BookDtlsDTO> getAllOldBook()
    {
         List<BookDtlsDTO> list = new ArrayList<BookDtlsDTO>();
        BookDtlsDTO b = null;
        
        try{
            String query = "SELECT * FROM book_dtls WHERE status=? AND bookCategory=? ORDER BY bookId DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,"Active");
            ps.setString(2,"OldBook");
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                b = new BookDtlsDTO();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
            b.setAuthor(rs.getString(3));
            b.setPrice(rs.getString(4));
            b.setBookCategory(rs.getString(5));
            b.setStatus(rs.getString(6));
            b.setPhotoName(rs.getString(7));
            b.setEmail(rs.getString(8));
            
            list.add(b);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return list;
    }

    public List<BookDtlsDTO> getBookByOld(String email, String category)
    {
        List<BookDtlsDTO> list = new ArrayList<BookDtlsDTO>();
        BookDtlsDTO b = null;
        
        try
        {
            String query = "SELECT * FROM book_dtls WHERE user_email=? AND bookCategory=?;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, category);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                b = new BookDtlsDTO();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                
                list.add(b);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
       return list; 
    }

    @Override
    public boolean oldBookDelete(int bookId, String email) 
    {
        boolean f = false;
        try
        {
         String query = "DELETE FROM book_dtls WHERE bookId=? AND user_email=?;";
         PreparedStatement ps = con.prepareStatement(query);
         ps.setInt(1, bookId);
         ps.setString(2, email);
         
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
    public List<BookDtlsDTO> getBookBySearch(String str) 
    {
        List<BookDtlsDTO> list = new ArrayList<BookDtlsDTO>();
        BookDtlsDTO b = null;
        
        try
        {
            String query = "SELECT * FROM book_dtls WHERE bookName LIKE ? OR author LIKE ? OR bookCategory LIKE ? AND status=?;";
            PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, "%"+str+"%");
                ps.setString(2, "%"+str+"%");
                ps.setString(3, "%"+str+"%");
                ps.setString(4, "Active");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                b = new BookDtlsDTO();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                
                list.add(b);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
       return list; 
    }
        
}
