package com.tap.utility;

import com.tap.DAO.UserDAO;
import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

public class App {
    public static void main(String[] args) {
    	
                //insert
    	
//     User u = new User( "raju","raju@gmail.com", "raju@123","9345299534","pattanagere","customer");
//
//      UserDAO udao = new UserDAOImpl();
//      udao.addUser(u);
//    	
            
    	//select*from  
    	
    	
  	UserDAO udao = new UserDAOImpl();

      User user = udao.getUser(3);

       System.out.println(user);
       
        
        
        //update
    	
//    	 UserDAOImpl userDAOImpl = new UserDAOImpl();   
//         User u = userDAOImpl.getUser(1);
//         System.out.println(u.getEmail());
//         
//         u.setEmail("shalinikr@gamil.com");
//         System.out.println(u.getEmail());
//           
//         UserDAOImpl userDAOImpl2 = new UserDAOImpl();
//		   userDAOImpl2.updateUser(u);
//         System.out.println("Updated");
    	
    	
    	//delete

//    	 UserDAOImpl userDAOImpl = new UserDAOImpl(); 
//    	 userDAOImpl .deleteUser(1);
//    	 System.out.print("deleted");
    	
 //   	
    	
 	
//    	
    	
    	OrderItemDAOImpl o = new OrderItemDAOImpl(); 
    	o .deleteOrderItem(2);
    	System.out.print("deleted");
    	
    	
    
          
        
    	
   	
   	
    	
    	
    	
    	
  	    
  	    
//    	
    	
           
    }
}