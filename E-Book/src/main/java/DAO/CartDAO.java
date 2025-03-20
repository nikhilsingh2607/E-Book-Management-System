
package DAO;

import dto.BookDtlsDTO;
import dto.CartDTO;
import java.util.List;

/**
 *
 * @author nikhil
 */
public interface CartDAO 
{
    public boolean addCart(CartDTO c);
    
    public List<CartDTO> getBookByUser(int userId);
    
    public boolean deleteBook(int cartId, int bookId,int userId);
}
