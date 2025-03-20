
package DAO;

import dto.BookOrderDTO;
import java.util.List;

/**
 *
 * @author nikhil
 */
public interface BookOrderDAO 
{  
    public boolean saveOrder(List<BookOrderDTO> b);
    
    public List<BookOrderDTO> getBook(String email);
    
    public List<BookOrderDTO> getAllOrder();
    
}
