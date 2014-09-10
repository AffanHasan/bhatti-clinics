package com.bhatti_clinics_mis.rest;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.mongodb.DB;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

@Path("/dailyopd")
@RequestScoped
public class DailyOPDRESTService {
	
   @Inject
   private DB dbConnection;
   
   @GET
   @Produces(MediaType.APPLICATION_JSON)
   public List<DBObject> listAllMembers() {
   	List<DBObject> documents = new ArrayList<DBObject>();
	DBCursor dbCursor =  dbConnection.getCollection("consultants").find();
	while(dbCursor.hasNext()){
		dbCursor.next();
	}
	return documents;
   }
}