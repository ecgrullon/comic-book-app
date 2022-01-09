import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed ?? () => Get.back(), 
    icon: const Icon(Icons.arrow_back_outlined), iconSize: 42, color: Colors.white);
  }
}
