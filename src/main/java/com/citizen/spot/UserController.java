package com.citizen.spot;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;

import com.citizen.spot.dao.UserDAO;
import com.citizen.spot.model.User;
import com.citizen.spot.util.HashUtil;

@Path("/User")
public class UserController {

    private static Logger logger = Logger.getLogger(UserController.class);
    private ObjectMapper mapper = new ObjectMapper();
    
	@POST
	@Path("register/")
	public Response createUser(String userStr) {

		UserDAO userDAO = new UserDAO();
		try {
			
			User user = mapper.readValue(userStr, User.class);
			user.setPassword(HashUtil.getSaltedHash(user.getPassword()));
			return Response.status(200).entity(userDAO.createUser(user)+"").build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Response.status(500).entity("Failed").build();
	}
	
	@POST
	@Path("login")
	public Response getUser(@QueryParam("userName") String userName, @QueryParam("password") String password) {

		UserDAO userDAO = new UserDAO();
		try {
			User user = userDAO.getUser(userName);
			if(HashUtil.check(password, user.getPassword())) {
				user.setPassword("");
				ObjectMapper mapper = new ObjectMapper();
				return Response.status(200).entity(mapper.writeValueAsString(user)).build();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return Response.status(500).entity(e.getMessage()).build();
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Response.status(500).entity("failed").build();
	}
	
	@GET
	@Path("list")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getUserList() {

		UserDAO userDAO = new UserDAO();
		try {
			ArrayList<User> users = userDAO.getUserList();
			return Response.status(200).entity(mapper.writeValueAsString(users)).build();
		} catch (SQLException e) {
			e.printStackTrace();
			return Response.status(500).entity(e.getMessage()).build();
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Response.status(500).entity("failed").build();
	}
}