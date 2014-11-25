package com.citizen.spot.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.citizen.spot.model.User;

public class UserDAO {


	private DataSource dataSource;
	 
	public UserDAO(){
	  try {
		Context ctx = new InitialContext();
		dataSource = (DataSource)ctx.lookup("java:comp/env/jdbc/citizenspot");
	  } catch (NamingException e) {
		e.printStackTrace();
	  }
	}
	
	public User getUser(String userName) throws SQLException {

		User user =  null;
		Connection connection = dataSource.getConnection();
		Statement statement = connection.createStatement();
		String sql = "SELECT * FROM user where user_name='"+userName+"'";
		ResultSet rs = statement.executeQuery(sql);

		while (rs.next()) {

			user = new User();
			user.setPassword(rs.getString("password"));
			user.setUserName(rs.getString("user_name"));
			user.setFirstName(rs.getString("first_name"));
			user.setLastName(rs.getString("last_name"));
			user.setEmail(rs.getString("email"));
		}
		rs.close();
		statement.close();
		connection.close();
		return user;
	}
	
	public ArrayList<User> getUserList() throws SQLException {

		ArrayList<User> users =  new ArrayList<User>();
		Connection connection = dataSource.getConnection();
		Statement statement = connection.createStatement();
		String sql = "SELECT * FROM user";
		ResultSet rs = statement.executeQuery(sql);

		while (rs.next()) {

			User user = new User();
			user.setUserName(rs.getString("user_name"));
			user.setFirstName(rs.getString("first_name"));
			user.setLastName(rs.getString("last_name"));
			user.setEmail(rs.getString("email"));
			users.add(user);
		}
		rs.close();
		statement.close();
		connection.close();
		return users;
	}
	
	public int createUser(User user) throws SQLException {

		Connection connection = dataSource.getConnection();
		Statement statement = connection.createStatement();
		String sql = "INSERT INTO user(user_name,password,first_name) values('"+user.getUserName()+"','"+user.getPassword()+"','"+user.getFirstName()+"')";
		int rowUpdated = statement.executeUpdate(sql);
		statement.close();
		connection.close();
		return rowUpdated;
	}
}