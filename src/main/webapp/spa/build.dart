import 'package:polymer/builder.dart';
        
main(args) {
  build(entryPoints: ['web/spa.html'],
        options: parseOptions(args));
}