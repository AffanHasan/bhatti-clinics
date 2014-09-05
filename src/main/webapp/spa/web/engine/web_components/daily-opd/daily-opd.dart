import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:intl/intl.dart' as intl;
import '../daily-opd-create-log-entry-form/daily-opd-create-log-entry-form.dart' as customForm;
import 'package:paper_elements/paper_dialog.dart' as paper_dialog;
import 'package:logging/logging.dart' as logging;
/**
 * A Polymer click counter element.
 */
@CustomTag('daily-opd')
class DailyOPD extends PolymerElement {

  logging.Logger _logger = new logging.Logger("daily-opd");

  Map document = toObservable({
    "date": new intl.DateFormat("E MMMM d, y", "en_US").format(new DateTime.now()),
    "log_entries": [],
    "hosp_net_income": 0,
    "consultants_net_amounts": {
      "1": {
        "net_fee": 0,
        "net_%": 0
      },
      "2": {
        "net_fee": 0,
        "net_%": 0
      },
      "3": {
        "net_fee": 0,
        "net_%": 0
      }
    }
  //Sent by the server in this form
  });

  List consultants = [{
      "_id": 1,
      "name": "Dr. Imtiaz Bhatti",
      "daily_opd_rate%": 60
    }, {
      "_id": 2,
      "name": "Dr. Khalid Bhatti",
      "daily_opd_rate%": 60
    }, {
      "_id": 3,
      "name": "Dr. Mumtaz Laghari",
      "daily_opd_rate%": 70
    }];

  Map viewData = toObservable({
    "header": {
      "left_cols": ["#", "Time Stamp", "Daily Patient"],
      "right_cols": ["Net Hospital Income", "Remarks"]
    },
    "log_entry_form": {

      "input_fields": {
        "log_id": null,
        "patient_info": {
          "value": null
        },
        "consultant": {
          "value": null
        },
        "consultant_fee": {
          "value": null
        },
        "remarks": {
          "value": null
        }
      },
      "submit_btn": (String action) {
        switch (action) {
          case "add":
            return {
              "show": true,
              "label": 'Add Entry',
              'enabled': false
            };
          case "update":
            return {
              "show": true,
              "label": 'Update',
              'enabled': true
            };
        }
      }
    }
  });

  attached() {
    super.attached();

  }

  DailyOPD.created() : super.created() {
//  Attaching a handler to display the log info to the console
    _logger.onRecord.listen((logging.LogRecord record) => print('${record.level.name}: ${record.time}: ${record.message}'));
  }

  void resetNetAmounts() {
    document['hosp_net_income'] = 0;
    consultants.forEach((item) {
      document['consultants_net_amounts'][item['_id'].toString()]['net_fee'] = 0;
      document['consultants_net_amounts'][item['_id'].toString()]['net_%'] = 0;
    });
  }

  void calculateNetAmounts() {
    //TODO: reset the net values first
    document['log_entries'].forEach((item) {
      document['consultants_net_amounts'][item["consultant"].toString()]['net_fee'] += item['fee'];
      document['consultants_net_amounts'][item["consultant"].toString()]['net_%'] += item['consultant_rate%'];
      document['hosp_net_income'] += item['net_hospital_income'];
    });
  }

//General function definition ends

//Event Handler Function Definitions Starts
  void addEditLogEntryEH(Event e, var detail, Node target) {
    e.preventDefault();
    switch (detail['action']) {
      case "add":
        var consultantId = detail['input_data']['input_fields']['consultant']['value'];
        int consultantRate = consultants.firstWhere((item) {
          return item["_id"] == consultantId;
        })['daily_opd_rate%'];
        int consultantFee = detail['input_data']['input_fields']['consultant_fee']['value'];
        double consultantRatePer = ((consultantFee / 100) * consultantRate);
        document['log_entries'].add(toObservable({
          "#": document['log_entries'].length + 1,
          "time_stamp": new intl.DateFormat("H:mm a", "en_US").format(new DateTime.now()),
          "patient_info": detail['input_data']['input_fields']['patient_info']['value'],
          "consultant": consultantId,
          "fee": consultantFee,
          "consultant_rate%": consultantRatePer,
          "net_hospital_income": consultantFee - consultantRatePer,
          "remarks": detail['input_data']['input_fields']['remarks']['value']
        }));
        break;
      case "update":
        var consultantId = detail['input_data']['input_fields']['consultant']['value'];
        int consultantRate = consultants.firstWhere((item) {
          return item["_id"] == consultantId;
        })['daily_opd_rate%'];
        int consultantFee = detail['input_data']['input_fields']['consultant_fee']['value'];
        double consultantRatePer = ((consultantFee / 100) * consultantRate);
        document['log_entries'][detail['input_data']['input_fields']['log_id'] - 1]['patient_info'] = detail['input_data']['input_fields']['patient_info']['value'];
        document['log_entries'][detail['input_data']['input_fields']['log_id'] - 1]['consultant'] = consultantId;
        document['log_entries'][detail['input_data']['input_fields']['log_id'] - 1]['fee'] = consultantFee;
        document['log_entries'][detail['input_data']['input_fields']['log_id'] - 1]['consultant_rate%'] = consultantRatePer;
        document['log_entries'][detail['input_data']['input_fields']['log_id'] - 1]['net_hospital_income'] = consultantFee - consultantRatePer;
        document['log_entries'][detail['input_data']['input_fields']['log_id'] - 1]['remarks'] = detail['input_data']['input_fields']['remarks']['value'];
        break;
    }
    //TODO: calculate net amounts
    resetNetAmounts();
    calculateNetAmounts();
  }

  void addLogEntryFormInputsEH(Event e, var detail, Node target) {
    _logger.info("Inside addLogEntryFormInputsEH");
    var flag = false;
    viewData['log_entry_form'].forEach((key, value) {
      if (key != "submit_btn" && key != "remarks" && key != "consultant") {
        if (value['value'] == null || value['value'] == "") flag = true;
      }
    });
    if (flag) {
      viewData['log_entry_form']['submit_btn']['enabled'] = false;
    } else {
      viewData['log_entry_form']['submit_btn']['enabled'] = true;
    }
  }

  void editLogEntryEH(Event e, var detail, Node target) {
    e.preventDefault();
    viewData['log_entry_form']['input_fields'].forEach((key, value) {
      switch (key) {
        case "patient_info":
          value['value'] = document['log_entries'][int.parse(target.attributes['entry-index']) - 1]['patient_info'];
          break;
        case "consultant":
          value['value'] = document['log_entries'][int.parse(target.attributes['entry-index']) - 1]['consultant'];
          break;
        case "consultant_fee":
          value['value'] = document['log_entries'][int.parse(target.attributes['entry-index']) - 1]['fee'];
          break;
        case "remarks":
          value['value'] = document['log_entries'][int.parse(target.attributes['entry-index']) - 1]['remarks'];
          break;
        case "log_id":
          viewData['log_entry_form']['input_fields']['log_id'] = document['log_entries'][int.parse(target.attributes['entry-index']) - 1]['#'];
          break;
      }
    });
    //<daily-opd-create-log-entry-form inputFieldsData="{{ viewData['log_entry_form']['input_fields'] }}" id="update-log-entry-form" on-formsubmit="{{ addEditLogEntryEH }}" consultantsList="{{ consultants }}" submitControlData="{{ viewData['log_entry_form']['submit_btn']('update') }}" ></daily-opd-create-log-entry-form>
    $['edit-log-entry-form'].children.clear();
    customForm.DailyOPDCreateLogEntryForm elem = new Element.tag("daily-opd-create-log-entry-form");
    elem.inputFieldsData = viewData['log_entry_form']['input_fields'];
    elem.submitControlData = viewData['log_entry_form']['submit_btn']('update');
    elem.consultantsList = consultants;
    elem.formType = "update";
    elem.addEventListener("formsubmit", (event) {
      addEditLogEntryEH(event, event.detail, event.target);
      ($['edit-log-entry-dialog'] as paper_dialog.PaperDialog).toggle();
    });
    $['edit-log-entry-form'].children.add(elem);
    ($['edit-log-entry-dialog'] as paper_dialog.PaperDialog).toggle();
  }

  void deleteLogEntryEH(Event e, var detail, Node target) {
    e.preventDefault();
    document['log_entries'].removeAt(int.parse(target.attributes['entry-index']) - 1);
    resetNetAmounts();
    calculateNetAmounts();
  }
//Event Handler Function Definitions Ends
}
