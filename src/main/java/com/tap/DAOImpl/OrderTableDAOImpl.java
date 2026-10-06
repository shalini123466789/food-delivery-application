package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import com.tap.DAO.OrderTableDAO;
import com.tap.model.OrderItem;
import com.tap.model.OrderTable;
import com.tap.utility.DBConnection;

public class OrderTableDAOImpl implements OrderTableDAO {
	
	private static final String INSET_QUERY="INSERT INTO OrderTable(userId,restaurantId,orderDate,totalAmount,status,paymentMethod) VALUES(?,?,?,?,?,?)";
	private static final String SELECT_QUERY="SELECT * FROM OrderTable WHERE orderId=?";
	private static final String UPDATE_QUERY="UPDATE OrderTable SET "
			+ "userId=?,restaurantId=?,orderDate=?,totalAmount=?,status=?,paymentMethod=? "
			+ "WHERE orderId=?";
	private static final String DELETE_QUERY = "DELETE FROM ordertable WHERE orderId=?";

	@Override
	public int addOrderTable(OrderTable orderTable) {

	    Connection con = DBConnection.getConnection();

	    try {

	        PreparedStatement pstm =
	                con.prepareStatement(
	                        INSET_QUERY,
	                        java.sql.Statement.RETURN_GENERATED_KEYS
	                );

	        pstm.setInt(1, orderTable.getUserId());
	        pstm.setInt(2, orderTable.getRestaurantId());
	        pstm.setTimestamp(
	                3,
	                new Timestamp(System.currentTimeMillis())
	        );
	        pstm.setDouble(4, orderTable.getTotalAmount());
	        pstm.setString(5, orderTable.getStatus());
	        pstm.setString(6, orderTable.getPaymentMethod());

	        pstm.executeUpdate();

	        ResultSet rs = pstm.getGeneratedKeys();

	        if (rs.next()) {
	            return rs.getInt(1);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return 0;
	}
    
    
    @Override
	public  OrderTable getOrderTable(int orderId) {

    	OrderTable orderTable=null;
		
		Connection con=DBConnection.getConnection();
		try{
			PreparedStatement	pstm=con.prepareStatement(SELECT_QUERY);
			pstm.setInt(1,orderId);
			
			ResultSet res=pstm.executeQuery();
			
			orderTable=extractOrderTable(res);
			
			}
		catch(SQLException e) {
	    	e.printStackTrace();
	    }
		
		return orderTable;
    }
    
    public static OrderTable extractOrderTable(ResultSet res) throws SQLException  {
    	OrderTable orderTable=null;
		while(res.next()) {
			int orderId  =res.getInt(1);
			int userId=res.getInt(2);
			int restaurantId=res.getInt(3);
			Timestamp orderDate=res.getTimestamp(4);
            double totalAmount=res.getDouble(5);
            String status=res.getString(6);
            String paymentMethod=res.getString(7);
           
            orderTable=new OrderTable(orderId,userId,restaurantId,orderDate,totalAmount,status,paymentMethod);
			}
		return orderTable;
		
    }
	
	 @Override
	public void updateOrderTable(OrderTable orderTable) {
          
    	Connection con=DBConnection.getConnection()	;
        
        try {
            	PreparedStatement	pstm=con.prepareStatement(UPDATE_QUERY);
            	pstm.setInt(1, orderTable.getUserId());
            	pstm.setInt(2, orderTable.getRestaurantId());
            	pstm.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            	pstm.setDouble(4, orderTable.getTotalAmount());
            	pstm.setString(5, orderTable.getStatus());
            	pstm.setString(6, orderTable.getPaymentMethod());
            	pstm.setInt(7,orderTable.getOrderId());
            	
            	int i=pstm.executeUpdate();
            	System.out.println(i+"row effected");
        }
        catch(SQLException e) {
        	e.printStackTrace();
        }
	}
    
    
    @Override
	public  void deleteOrderTable(int orderId) {
    	
    	Connection con=DBConnection.getConnection();
		try {
			PreparedStatement pstm	=con.prepareStatement(DELETE_QUERY);
			  pstm.setInt(1,orderId);
			  
           int i=pstm.executeUpdate();
		}
		catch (SQLException e) {
            e.printStackTrace();
        }
    	
    }
    
    
    @Override
	public   List<OrderTable> getAllOrderTable(){
    	
    	return null;
		
	}
}
