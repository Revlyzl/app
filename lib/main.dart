import 'package:flutter/material.dart';
import 'package:app/view/Dashboard/dashboard.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Dashboard(),
      
    );
  }
}