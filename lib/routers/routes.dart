import 'package:fluro/fluro.dart';
import 'package:koala_app/routers/router_handler.dart';

class Routes {
  static String root = '/';
  static String cameraDetail = "/camera";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler =  Handler( handlerFunc: (context, params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });

    router.define(cameraDetail, handler: photoHandler);
  }
}