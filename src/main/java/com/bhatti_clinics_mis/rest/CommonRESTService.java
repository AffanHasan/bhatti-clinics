package com.bhatti_clinics_mis.rest;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.mongodb.DB;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

@Path("/common")
@RequestScoped
public class CommonRESTService {

   @Inject
   private DB dbConnection;
   
   @GET
   @Path("/consultantslist")
   @Produces(MediaType.APPLICATION_JSON)
   public Response listAllMembers() {
	   	List<DBObject> documents = new ArrayList<DBObject>();
		DBCursor dbCursor =  dbConnection.getCollection("consultants").find();
		while(dbCursor.hasNext()){
			documents.add(dbCursor.next());
		}
		Response response = Response.ok()
				   .header("Access-Control-Allow-Origin", "*")
				   .header("Access-Control-Allow-Methods", "GET, PUT, POST, DELETE")
				   .header("Access-Control-Allow-Headers","Origin, X-Requested-With, Content-Type, Accept")
				   .entity(documents)
				   .build();
		return response;
   }
}