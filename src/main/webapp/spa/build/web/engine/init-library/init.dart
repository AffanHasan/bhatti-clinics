/*
 * This library initialize the application
 */

import 'package:polymer/polymer.dart';
import '../common-data-lib/common-data-lib.dart' as cmn_data_lib show main;

main(){
  cmn_data_lib.main();//Load the application wide common data
  initPolymer();//Initiallize polymer.dart
}