package com.bhatti_clinics_mis.rest;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.Path;

import com.mongodb.DB;

@Path("/dailyopd")
@RequestScoped
public class DailyOPDRESTService {
	
   @Inject
   private DB dbConnection;
   
}