
import 'package:comicbook/app/bindings/home_binding.dart';
import 'package:comicbook/app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/routes/app_pages.dart';


void main() async {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      title: 'comicbook app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        primaryColor:  Colors.white,
        fontFamily: 'Poppins',
      ),
      getPages: AppPages.pages,
      home: HomePage(),
      initialBinding:  HomeBinding(),
      // home: SplashPage(),
      // initialBinding: SplashBinding(),

    );
  }
}