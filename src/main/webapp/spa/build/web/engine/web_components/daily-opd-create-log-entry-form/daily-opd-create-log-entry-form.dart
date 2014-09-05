import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart' as logging;
/**
 * A generic form element.
 */
@CustomTag('daily-opd-create-log-entry-form')
class DailyOPDCreateLogEntryForm extends PolymerElement with ChangeNotifier  {
  
  logging.Logger _logger = new logging.Logger("daily-opd-create-log-entry-form");
  
  @reflectable @published
  String get formType => __$formType; String __$formType; @reflectable set formType(String value) { __$formType = notifyPropertyChange(#formType, __$formType, value); }
  
  @reflectable @published
  Map get submitControlData => __$submitControlData; Map __$submitControlData = {}; @reflectable set submitControlData(Map value) { __$submitControlData = notifyPropertyChange(#submitControlData, __$submitControlData, value); }
  
  @reflectable @published
  Map get inputFieldsData => __$inputFieldsData; Map __$inputFieldsData = {}; @reflectable set inputFieldsData(Map value) { __$inputFieldsData = notifyPropertyChange(#inputFieldsData, __$inputFieldsData, value); }
  
  Map submitControl = toObservable({ "show" : true, "label" : null, 'enabled' : false });
  
  Map inputData = toObservable({
                    "input_fields" : {
                                        "log_id" : null,
                                        "patient_info" : {
                                                          "value" : null
                                                         },
                                        "consultant" : {
                                                          "value" : null
                                                       },
                                        "consultant_fee" : {
                                                              "value" : null
                                                           },
                                        "remarks" : {
                                                      "value" : null
                                                    }
                                     }
                  });
  
  @reflectable @published
  List get consultantsList => __$consultantsList; List __$consultantsList = []; @reflectable set consultantsList(List value) { __$consultantsList = notifyPropertyChange(#consultantsList, __$consultantsList, value); }
  
  attached(){
    super.attached();
    submitControl['show'] = submitControlData['show'];
    submitControl['label'] = submitControlData['label'];
    submitControl['enabled'] = submitControlData['enabled'];
    //Populating Input fields
    if(!inputFieldsData.isEmpty){
      inputData['input_fields']['patient_info']['value'] = inputFieldsData['patient_info']['value'];
      inputData['input_fields']['consultant']['value'] = inputFieldsData['consultant']['value'];
      inputData['input_fields']['consultant_fee']['value'] = inputFieldsData['consultant_fee']['value'];
      inputData['input_fields']['remarks']['value'] = inputFieldsData['remarks']['value'];
      inputData['input_fields']['log_id'] = inputFieldsData['log_id'];
    }
  }

  DailyOPDCreateLogEntryForm.created() : super.created() {
//  Attaching a handler to display the log info to the console
    _logger.onRecord.listen((logging.LogRecord record) => print('${record.level.name}: ${record.time}: ${record.message}'));
  }

//General function definition starts
  void validateRequiredFields(){
    if((inputData['input_fields']['patient_info']['value']== null || inputData['input_fields']['patient_info']['value'] == "")
        ||
        (inputData['input_fields']['consultant_fee']['value']== null || inputData['input_fields']['consultant_fee']['value'] == "")
       ){
      submitControl['enabled'] = false;
    }else{
      submitControl['enabled'] = true;
    }
  }
  
  void resetForm(){
    inputData['input_fields'].forEach(
        ( key, value ){
          if(key == "log_id")
            value = null;
          else
            value['value'] = null;
        }
    );
    submitControl['enabled'] = false;
  }
  
//General function definition ends
  
//Event Handler Function Definitions Starts
  void formSubmitEH(Event e, var detail, Node target){
    if(inputData['input_fields']['consultant']['value'] == null || inputData['input_fields']['consultant']['value'] == "" ){
      inputData['input_fields']['consultant']['value'] = int.parse($['consultant-select'].value);
    }
    dispatchEvent(new CustomEvent("formsubmit", detail: { 'input_data' : inputData, 'action' : formType }));
    resetForm();
  }
  
  void inputFieldsEH(Event e, var detail, Node target){
        switch(target.id){
          case "patient-info-input":
            inputData['input_fields']['patient_info']['value'] = target.value;
            break;
          case "fee-input":
            inputData['input_fields']['consultant_fee']['value'] = int.parse(target.value);
            break;
          case "consultant-select":
            inputData['input_fields']['consultant']['value'] = int.parse(target.value);
            break;
          case "remarks":
            inputData['input_fields']['remarks']['value'] = target.value;
            break;
        }
        validateRequiredFields();
  }
//Event Handler Function Definitions Ends
}