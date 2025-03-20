/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import dto.BookDtlsDTO;
import java.util.List;

/**
 *
 * @author nikhi
 */
public interface BookDAO
{
    public boolean addBooks(BookDtlsDTO b);
    
    public List<BookDtlsDTO> getAllBooks();
    
    public BookDtlsDTO getBookById(int id);
    
    public boolean UpdateEditBooks(BookDtlsDTO b);
    
    public boolean DeleteBooks(int id);
    
    public List<BookDtlsDTO> getNewBook();
    
    public List<BookDtlsDTO> getRecentBook();
    
    public List<BookDtlsDTO> getOldBook();
    
    public List<BookDtlsDTO> getAllRecentBook();
    
    public List<BookDtlsDTO> getAllNewBook();
    
    public List<BookDtlsDTO> getAllOldBook();
    
    public List<BookDtlsDTO> getBookByOld(String email, String category);
    
    public boolean oldBookDelete(int bookId , String email );

    public List<BookDtlsDTO> getBookBySearch(String str);
}