import 'package:flutter/material.dart';
import 'package:flutter_application_travel/colors.dart';
import 'package:flutter_application_travel/pages/home_page.dart';
import 'package:flutter_application_travel/widgets/app_large_text.dart';
import 'package:flutter_application_travel/widgets/app_text.dart';
import 'package:flutter_application_travel/widgets/responsive-button.dart';

import 'navpages/main_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  //
  List text = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppLargeText(text: "Trips"),
                        const AppText(text: "Mountain", size: 30),
                        const SizedBox(height: 20),
                        const SizedBox(
                            width: 250,
                            child: AppText(
                              text:
                                  "Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....",
                              color: Colors.white60,
                              size: 14,
                            )),
                        const SizedBox(height: 50),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()));
                            },
                            child: const ResponsiveButton())
                      ],
                    ),
                    Column(
                        children: List.generate(3, (indexDots) {
                      return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(0.9)));
                    }))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
