/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import dto.UserDTO;

/**
 *
 * @author nikhil
 */
public interface UserDAO 
{
    public boolean userRegistration(UserDTO user);
    
    public UserDTO login(String email,String password);
    
    public String checkPassword(int userId );
    
    public boolean updateProfile(UserDTO user);
    
    public boolean checkUser(String email);
}
