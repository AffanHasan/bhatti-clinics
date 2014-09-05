import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart' as logging;

/**
 * A Polymer click counter element.
 */
@CustomTag('test-component')
class TestComponent extends PolymerElement with ChangeNotifier  {
  
  logging.Logger _logger = new logging.Logger("test-component");
  
  @reflectable @observable
  Map get map => __$map; Map __$map = toObservable(
      {
        "list" :  [
                   { "name" : "Aslam", "points" : 0 },
                   { "name" : "Faizan", "points" : 0 },
                   { "name" : "Nasir", "points" : 0 },
                   { "name" : "Abid", "points" : 0 }
                  ]
      }
  ); @reflectable set map(Map value) { __$map = notifyPropertyChange(#map, __$map, value); }

  TestComponent.created() : super.created() {
    _logger.onRecord.listen((logging.LogRecord record) => print('${record.level.name}: ${record.time}: ${record.message}'));//Attaching a handler to display the log info to the console
    /*
    map['list'] = toObservable([
                                { "name" : "Aslam", "points" : 0 },
                                { "name" : "Faizan", "points" : 0 },
                                { "name" : "Nasir", "points" : 0 },
                                { "name" : "Abid", "points" : 0 }
                               ]);
    */
  }
  
  void addPointsEH(event, var detail, Node target){
    map["list"][3]['points']++;
  }
}