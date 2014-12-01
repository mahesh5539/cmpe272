package com.citizen.spot.model;

import java.io.Serializable;
import java.sql.Date;

public class ProblemTemp implements Serializable{
	
	private static final long serialVersionUID = 7511532275090561421L;
	private String problemType;
	private int problemSeverity;
	private Date problemDate;
	private String street;
	private String city;
	private String state;
	private String country;
	private String zip;
	private String description;
	private String fileName;
	private String uploadedBy;
	
	public String toString() { 
	    return "problem Type: '" + this.problemType + 
	    		"', problem Severity: '" + this.problemSeverity + 
	    		"', problem Date: '" + this.problemDate + "'" + 
	    	    "', street: '" + this.street + "'" + 
	    	    "', city: '" + this.city + "'" + 
	    	    "', state: '" + this.state + "'" + 
	    	    "', country: '" + this.country + "'" + 
	    	    "', zip: '" + this.zip + "'" + 
	    	    "', file Name: '" + this.fileName + "'" + 
	    	    "', uploaded By: '" + this.uploadedBy + "'";
	}
	
	public String getProblemType() {
		return problemType;
	}
	public void setProblemType(String problemType) {
		this.problemType = problemType;
	}
	public int getProblemSeverity() {
		return problemSeverity;
	}
	public void setProblemSeverity(int problemSeverity) {
		this.problemSeverity = problemSeverity;
	}
	public Date getProblemDate() {
		return problemDate;
	}
	public void setProblemDate(Date problemDate) {
		this.problemDate = problemDate;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUploadedFileLocation() {
		return fileName;
	}
	public void setUploadedFileLocation(String uploadedFileLocation) {
		this.fileName = uploadedFileLocation;
	}
	public String getUploadedBy() {
		return uploadedBy;
	}
	public void setUploadedBy(String uploadedBy) {
		this.uploadedBy = uploadedBy;
	}
}
