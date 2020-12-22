import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color color;

  BackButtonWidget({
    this.color = Colors.white,
    this.icon = Icons.keyboard_backspace,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(icon, color: color),
      onTap: () => Get.back(),
    );
  }
}
