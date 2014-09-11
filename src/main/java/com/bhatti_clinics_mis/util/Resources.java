package com.bhatti_clinics_mis.util;

import java.net.UnknownHostException;
import java.util.logging.Logger;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Produces;
import javax.enterprise.inject.spi.InjectionPoint;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import com.bhatti_clinics_mis.util.customcdiqualifiers.CORSHeaderResponseBuilder;
import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;

/**
 * This class uses CDI to alias Java EE resources, such as the persistence context, to CDI beans
 * 
 * <p>
 * Example injection on a managed bean field:
 * </p>
 * 
 * <pre>
 * &#064;Inject
 * private EntityManager em;
 * </pre>
 */
public class Resources {
	
   @ApplicationScoped
   private MongoClient connectionPools;
	
   public Resources() {
	 try {
		connectionPools = new MongoClient( new MongoClientURI("mongodb://admin:admin@ds035270.mongolab.com:35270/mis") );
	} catch (UnknownHostException e) {
		e.printStackTrace();
	}
   }
   
   // use @SuppressWarnings to tell IDE to ignore warnings about field not being referenced directly
   @SuppressWarnings("unused")
   @Produces
   @PersistenceContext
   private EntityManager em;
   
   @Produces
   public Logger produceLog(InjectionPoint injectionPoint) {
      return Logger.getLogger(injectionPoint.getMember().getDeclaringClass().getName());
   }
   
   @Produces
   public DB getMongoDBConnection(){
	   return connectionPools.getDB("mis");
   }
   
   /**
    * This method returns a ResponseBuilder object which contains the CORS( Cross Origin Resource Sharing ) headers
    * 
    * <p>This method do not have an entity in it</p>
    */
   @Produces
   @CORSHeaderResponseBuilder
   public ResponseBuilder getCORSHeaderResponse(){
	   ResponseBuilder responseBuilder = Response.ok()
			   .header("Access-Control-Allow-Origin", "*")
			   .header("Access-Control-Allow-Methods", "GET, PUT, POST, DELETE")
			   .header("Access-Control-Allow-Headers","Origin, X-Requested-With, Content-Type, Accept");
	   return responseBuilder;
   }
}