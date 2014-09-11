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
import javax.ws.rs.core.Response.ResponseBuilder;

import com.bhatti_clinics_mis.util.customcdiqualifiers.CORSHeaderResponseBuilder;
import com.mongodb.DB;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

@Path("/common")
@RequestScoped
public class CommonRESTService {

   @Inject
   private DB dbConnection;
   
   @Inject
   @CORSHeaderResponseBuilder
   private ResponseBuilder corsResponseBuilder;
   
   @GET
   @Path("/consultantslist")
   @Produces(MediaType.APPLICATION_JSON)
   public Response listAllMembers() {
	   	List<DBObject> documents = new ArrayList<DBObject>();
		DBCursor dbCursor =  dbConnection.getCollection("consultants").find();
		while(dbCursor.hasNext()){
			documents.add(dbCursor.next());
		}
		corsResponseBuilder.entity(documents);
		return corsResponseBuilder.build();
   }
}