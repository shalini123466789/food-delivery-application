package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.model.Menu;
import com.tap.model.OrderItem;
import com.tap.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO{
	
	private static final String INSET_QUERY="INSERT INTO OrderItem(orderId,menuId,quantity,itemTotal) VALUES(?,?,?,?)";
	private static final String SELECT_QUERY="SELECT * FROM OrderItem WHERE orderItemId=?";
	private static final String UPDATE_QUERY="UPDATE OrderItem SET "
			+ "orderId=?,menuId=?,quantity=?,itemTotal=? "
			+ "WHERE orderItemId=?";
	private static final String DELETE_QUERY = "DELETE FROM OrderItem WHERE orderItemId=?";

	@Override
	public void addOrderItem(OrderItem orderItem) {
		 
		Connection con=DBConnection.getConnection()	;
	    
	    try {
	        	PreparedStatement	pstm=con.prepareStatement(INSET_QUERY);
	        	pstm.setInt(1, orderItem.getOrderId());
	        	pstm.setInt(2, orderItem.getMenuId());
	        	pstm.setInt(3, orderItem.getQuantity());
	        	pstm.setDouble(4, orderItem.getItemTotal());
	        	
	           
	        	int i=pstm.executeUpdate();
	        	System.out.println(i+"row effected");
	    }
	    catch(SQLException e) {
	    	e.printStackTrace();
	    }
	}

	
	
	@Override
	public OrderItem getOrderItem(int orderItemId) {
		
		OrderItem orderItem=null;
		
		Connection con=DBConnection.getConnection();
		try{
			PreparedStatement	pstm=con.prepareStatement(SELECT_QUERY);
			pstm.setInt(1,orderItemId );
			
			ResultSet res=pstm.executeQuery();
			
			orderItem=extractMenu(res);
			
			}
		catch(SQLException e) {
	    	e.printStackTrace();
	    }
		
		return orderItem;
	}
	
	public static OrderItem extractMenu(ResultSet res) throws SQLException  {
		OrderItem orderItem=null;
		while(res.next()) {
			int orderItemId=res.getInt(1);
			int orderId=res.getInt(2);
			int menuId=res.getInt(3);
			int quantity=res.getInt(4);
            double itemTotal=res.getDouble(5);
           
			orderItem=new OrderItem(orderItemId,orderId,menuId,quantity,itemTotal);
			}
		return orderItem;
		
	}
	
	

	@Override
	public void updateOrderItem(OrderItem orderItem) {
         Connection con=DBConnection.getConnection()	;
	    
	    try {
	        	PreparedStatement pstm=con.prepareStatement(UPDATE_QUERY);
	        	pstm.setInt(1, orderItem.getOrderId());
	        	pstm.setInt(2, orderItem.getMenuId());
	        	pstm.setInt(3, orderItem.getQuantity());
	        	pstm.setDouble(4, orderItem.getItemTotal());
	        	 pstm.setInt(5,orderItem .getOrderItemId());
	           
	        	int i=pstm.executeUpdate();
	        	System.out.println(i+"row effected");
	    }
	    catch(SQLException e) {
	    	e.printStackTrace();
	    }
		
	}

	@Override
	public void deleteOrderItem(int orderItemId) {
		Connection con=DBConnection.getConnection();
		try {
			PreparedStatement pstm	=con.prepareStatement(DELETE_QUERY);
			  pstm.setInt(1,orderItemId);
			  
           int i=pstm.executeUpdate();
		}
		catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

	@Override
	public List<OrderItem> getAllOrderItem() {
	    List<OrderItem> orderItemList = new java.util.ArrayList<>();
	    String selectAllQuery = "SELECT * FROM OrderItem";

	    Connection con = DBConnection.getConnection();
	    try {
	        PreparedStatement pstm = con.prepareStatement(selectAllQuery);

	        ResultSet res = pstm.executeQuery();

	        while (res.next()) {
	            int orderItemId = res.getInt(1);
	            int orderId = res.getInt(2);
	            int menuId = res.getInt(3);
	            int quantity = res.getInt(4);
	            double itemTotal = res.getDouble(5);

	            OrderItem orderItem = new OrderItem(orderItemId, orderId, menuId, quantity, itemTotal);
	            orderItemList.add(orderItem);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return orderItemList;
	}
}
