package com.tap.DAO;

import java.util.List;


import com.tap.model.OrderTable;

public interface OrderTableDAO {
   
	   int addOrderTable(OrderTable orderTable);
	   OrderTable getOrderTable(int orderId);
	   void updateOrderTable(OrderTable orderTable);
	   void deleteOrderTable(int orderId);
	   List<OrderTable> getAllOrderTable();
	   
}
