library common_data_lib;

import 'dart:html';
import 'dart:convert' show JSON;

List _consultantsList;
List get consultantsList => _consultantsList;

final String domainName = "http://localhost:8080";
//final String domainName = "http://mis-bhatticlinics.rhcloud.com/";

main(){
//  Getting consultants list by making a synchronous http request 
  HttpRequest req = new HttpRequest();
  req..onReadyStateChange.listen(
          ( event ){
            if(req.readyState == HttpRequest.DONE && req.status == 200)
              _consultantsList = JSON.decode(req.responseText);
          }
       )
     ..open("GET", "$domainName/bhatti-clinics-mis/rest/common/consultantslist", async : false)
     ..send();
}