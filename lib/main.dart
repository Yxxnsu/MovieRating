import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/service/controller.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  static MaterialColor purple = MaterialColor(
  0xFF673AB7,
  <int, Color>{
     50: Color(0xFFF3E5F5),
    100: Color(0xFFE1BEE7),
    200: Color(0xFFCE93D8),
    300: Color(0xFFBA68C8),
    400: Color(0xFFAB47BC),
    500: Colors.purple,
    600: Color(0xFF8E24AA),
    700: Color(0xFF7B1FA2),
    800: Color(0xFF6A1B9A),
    900: Color(0xFF4A148C),
  },
);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    final stateController controller = Get.put(stateController());
 
    return GetMaterialApp(     
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: purple,
      ),
      home: HomePage(),
    );
  }
}

