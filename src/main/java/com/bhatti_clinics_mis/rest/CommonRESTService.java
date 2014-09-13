package com.bhatti_clinics_mis.rest;

import java.util.List;
import java.util.logging.Logger;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import com.bhatti_clinics_mis.util.enums.CommonResourcesTypes;
import com.bhatti_clinics_mis.util.qualifiers.CommonResource;
import com.mongodb.DBObject;

/**
 * <p>This rest service is intended for providing the mis wide common resources</p>
 * @author affan.hasan
 *
 */
@Path("/common")
@RequestScoped
public class CommonRESTService {
	
   @Inject
   private Logger logger;
	
   @Inject
   @CommonResource(CommonResourcesTypes.CORS_HEADERS_RESPONSE_BUILDER)
   private ResponseBuilder corsResponseBuilder;
   
   @Inject
   @CommonResource(CommonResourcesTypes.CONSULTANTS_LIST)
   private List<DBObject> consultantsList;
   
   @GET
   @Path("/consultantslist")
   @Produces(MediaType.APPLICATION_JSON)
   public Response listAllMembers() {
		corsResponseBuilder.entity(consultantsList);
		return corsResponseBuilder.build();
   }
}