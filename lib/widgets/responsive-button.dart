import 'package:flutter/material.dart';
import 'package:flutter_application_travel/colors.dart';
import 'package:flutter_application_travel/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponive;
  final double? width;
  const ResponsiveButton({super.key, this.isResponive = false, this.width = 120});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: isResponive == true ? double.maxFinite : width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor),
        child: Center(
          child: Row(
              mainAxisAlignment: isResponive == true
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                isResponive == true
                    ? const AppText(text: "Book trip now")
                    : Container(),
                Image.asset("assets/images/icon-one.png"),
              ]),
        ),
      ),
    );
  }
}
