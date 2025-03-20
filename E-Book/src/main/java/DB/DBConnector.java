
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nikhil
 */
public class DBConnector 
{
    static Statement st = null;
    static Connection con = null;
    static
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-book","root","root");
            
            st = con.createStatement();
        }
        catch(SQLException e)
        {
            System.out.println(e);
        } 
        catch (ClassNotFoundException e) 
        {
            System.out.println(e);
        }
        
    }
    public static Connection getConnection()
    {
        return con;
    }
    public static Statement getStatement()
    {
        return st;
    }
}
