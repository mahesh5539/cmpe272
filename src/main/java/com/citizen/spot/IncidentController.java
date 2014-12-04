package com.citizen.spot;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.UUID;

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

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;

import com.sun.jersey.multipart.FormDataParam;
import com.citizen.spot.model.ProblemTemp;
import com.citizen.spot.util.CitizenSpotUtil;

@Path("/Incident")
public class IncidentController {

    private static Logger logger = Logger.getLogger(IncidentController.class);
    
	@POST
	@Path("upload/")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public Response uploadProblem(
			@FormDataParam("picture") InputStream uploadedInputStream,
			@FormDataParam("problemType") String problemType,
			@FormDataParam("problemSeverity") int problemSeverity,
			@FormDataParam("problem-date") Date problemDate,
			@FormDataParam("street") String street,
			@FormDataParam("city") String city,
			@FormDataParam("state") String state,
			@FormDataParam("country") String country,
			@FormDataParam("zip") String zip,
			@FormDataParam("description") String description) {

		File photoDirectory = new File("images/problems");
		String rootPath = photoDirectory.getAbsolutePath();
		String fileName = CitizenSpotUtil.getUUID()+".jpg";
        String uploadedFileLocation = rootPath + fileName;
        
        // save it
        try {
            writeToFile(uploadedInputStream, uploadedFileLocation);
            // from here save the problem object to database
            ProblemTemp problem = new ProblemTemp();
            problem.setProblemType(problemType);
            problem.setProblemSeverity(problemSeverity);
            problem.setProblemDate(problemDate);
            problem.setStreet(street);
            problem.setCity(city);
            problem.setState(state);
            problem.setCountry(country);
            problem.setZip(zip);
            problem.setDescription(description);
            problem.setUploadedBy("username from session");
            problem.setUploadedFileLocation(fileName);
            System.out.println(problem);
            // database call to save the problem object
        } catch(Exception e) {
        	logger.error(e.getMessage());
            return Response.status(500).entity(e.getMessage()).build();
        }
		return Response.status(200).entity("success").build();
	}
	
    // save uploaded file to new location
    private void writeToFile(InputStream uploadedInputStream, String uploadedFileLocation) throws Exception {
        OutputStream out = new FileOutputStream(new File(uploadedFileLocation));
        int read = 0;
        byte[] bytes = new byte[1024];

        out = new FileOutputStream(new File(uploadedFileLocation));
        while ((read = uploadedInputStream.read(bytes)) != -1) {
            out.write(bytes, 0, read);
        }
        out.flush();
        out.close();
    }
}