package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

	private static final String INSERT_QUERY="INSERT INTO Restaurant(name,cuisineType,deliveryTime,address,rating,isActive,imagePath)VALUES(?,?,?,?,?,?,?)";
	private static final String SELECT_QUERY="SELECT * FROM  Restaurant WHERE id=?";
	private static final String UPDATE_QUERY = "UPDATE Restaurant SET name=?,cuisineType=?,deliveryTime=?,address=?,rating=?,isActive=?,imagePath=? "
			+ "WHERE id=?";
	private static final String DELETE_QUERY = "DELETE FROM Restaurant WHERE id=?";

	@Override
	public void addRestaurant(Restaurant restaurant) {
		Connection con=DBConnection.getConnection();
		try {
			PreparedStatement	pstm=con.prepareStatement(INSERT_QUERY);
			
			pstm.setString(1,restaurant.getName());
			pstm.setString(2,restaurant.getCuisineType());
			pstm.setDouble(3,restaurant.getDeliveryTime());
			pstm.setString(4,restaurant.getAddress());
			pstm.setDouble(5,restaurant.getRating());
			pstm.setBoolean(6,restaurant.getActive());
			pstm.setString(7,restaurant.getImagePath());
			
			int i=pstm.executeUpdate();
			System.out.print(i+" row effect");
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

	
	
	@Override
	public Restaurant get(int id) {
		Restaurant restaurant=null;
		
		Connection con=DBConnection.getConnection();
		try {
			PreparedStatement	pstm=con.prepareStatement(SELECT_QUERY);
			
			pstm.setInt(1, id);
			
			ResultSet res=pstm.executeQuery();
			
			restaurant=extractUser (res);
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return restaurant;
		
	}
	
	public static  Restaurant extractUser (ResultSet res) throws SQLException {
		Restaurant restaurant=null;
		while(res.next()) {
			int id=res.getInt(1);
			String name=res.getString(2);
			String cuisineType=res.getString(3);
			double deliveryTime=res.getDouble(4);
			String address=res.getString(5);
			double rating=res.getDouble(6);
			boolean isActive=res.getBoolean(7);
			String imagePath=res.getString(8);
			
			
			restaurant=new Restaurant(id, name,cuisineType,deliveryTime,address,rating,isActive,imagePath);
			
		}
		return restaurant;
		
	}
	
	
	
	@Override
	public void updateRestaurant(Restaurant restaurant) {
		Connection con=DBConnection.getConnection();
		try {
			PreparedStatement	pstm=con.prepareStatement(UPDATE_QUERY);
			
			pstm.setString(1,restaurant.getName());
			pstm.setString(2,restaurant.getCuisineType());
			pstm.setDouble(3,restaurant.getDeliveryTime());
			pstm.setString(4,restaurant.getAddress());
			pstm.setDouble(5,restaurant.getRating());
			pstm.setBoolean(6,restaurant.getActive());
			pstm.setString(7,restaurant.getImagePath());
			pstm.setInt(8,restaurant .getId());
			
			int i=pstm.executeUpdate();
			System.out.print(i+" row effect");
			
		}
		
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void deleteRestaurant(int id) {
		Connection con=DBConnection.getConnection();
		try {
			PreparedStatement pstm	=con.prepareStatement(DELETE_QUERY);
			  pstm.setInt(1,id);
			  
           int i=pstm.executeUpdate();
		}
		catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

	
	@Override
	public List<Restaurant> getAllRestaurant() {
		  List<Restaurant> restaurantList = new java.util.ArrayList<>();
		    String selectAllQuery = "SELECT * FROM Restaurant";

		    Connection con = DBConnection.getConnection();
		    try {
		        PreparedStatement pstm = con.prepareStatement(selectAllQuery);

		        ResultSet res = pstm.executeQuery();

		        while (res.next()) {
		            int id = res.getInt(1);
		            String name = res.getString(2);
		            String cuisineType = res.getString(3);
		            double deliveryTime = res.getDouble(4);
		            String address = res.getString(5);
		            double rating = res.getDouble(6);
		            boolean isActive = res.getBoolean(7);
		            String imagePath = res.getString(8);

		            Restaurant restaurant = new Restaurant(id, name, cuisineType, deliveryTime, address, rating, isActive, imagePath);
		            restaurantList.add(restaurant);
		            
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return restaurantList;
	}

}
