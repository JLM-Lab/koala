import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:koala_app/pages/camera_detail.dart';

Handler photoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String articleUrl = params['id']?.first;
      String title = params['title']?.first;
      return CameraDetail(articleUrl, title);
    });