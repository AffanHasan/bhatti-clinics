/**
 * 
 */
package com.bhatti_clinics_mis.util;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Produces;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import com.bhatti_clinics_mis.util.enums.CommonResourcesTypes;
import com.bhatti_clinics_mis.util.qualifiers.CommonResource;
import com.mongodb.DB;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;

/**
 * <p>This class is used to provide mis wide common resources.</p>
 * 
 * @author affan.hasan
 *
 */

@ApplicationScoped
public class CommonResources {
	
	private MongoClient connectionPools;
	
	public CommonResources(){
	 try {
		    System.out.println("CommonResources Instantiated");
			connectionPools = new MongoClient( new MongoClientURI("mongodb://admin:admin@ds035270.mongolab.com:35270/mis") );
		 } catch (UnknownHostException e) {
			e.printStackTrace();
		}
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
   @CommonResource(CommonResourcesTypes.CORS_HEADERS_RESPONSE_BUILDER)
   public ResponseBuilder getCORSHeaderResponse(){
	   ResponseBuilder responseBuilder = Response.ok()
			   .header("Access-Control-Allow-Origin", "*")
			   .header("Access-Control-Allow-Methods", "GET, PUT, POST, DELETE")
			   .header("Access-Control-Allow-Headers","Origin, X-Requested-With, Content-Type, Accept");
	   return responseBuilder;
   }
   
   @Produces()
   @CommonResource(CommonResourcesTypes.CONSULTANTS_LIST)
   public List<DBObject> getConsultantsList(){
	   List<DBObject> documents = new ArrayList<DBObject>();
		DBCursor dbCursor = this.getMongoDBConnection().getCollection("consultants").find();
		while(dbCursor.hasNext()){
			documents.add(dbCursor.next());
		}
		return documents;
   }
}