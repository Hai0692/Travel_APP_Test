import 'package:flutter/material.dart';
import 'package:flutter_application_travel/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  final String? text;
  final IconData? icon;
  final bool? isIcons;
  const AppButton(
      {super.key,
      required this.color,
      required this.backgroundColor,
      required this.size,
      required this.borderColor,
      this.text = "1",
      this.icon,
      this.isIcons = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor),
      child: isIcons == false
          ? Center(
              child: AppText(
              text: text!,
              color: color,
            ))
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
