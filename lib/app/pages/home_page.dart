import 'package:comicbook/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => const Scaffold(
        body: Center(child: Text('Home'))
      ));
  }
}
