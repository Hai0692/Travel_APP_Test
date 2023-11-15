import 'package:flutter/material.dart';
import 'package:flutter_application_travel/colors.dart';
import 'package:flutter_application_travel/pages/home_page.dart';
import 'package:flutter_application_travel/widgets/app_large_text.dart';
import 'package:flutter_application_travel/widgets/app_text.dart';

import '../widgets/app_button.dart';
import '../widgets/responsive-button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStar = 3;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/welcome-three.png"),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                left: 20,
                top: 40,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ))
                  ],
                )),
            Positioned(
                top: 280,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AppLargeText(
                                text: "Yosemite", color: Colors.black),
                            AppLargeText(
                                text: "\$ 250", color: AppColors.mainColor),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            const SizedBox(width: 5),
                            AppText(
                              text: "USA califonia",
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: gottenStar > index
                                      ? Colors.yellow
                                      : Colors.grey,
                                  size: 20,
                                );
                              }),
                            ),
                            const SizedBox(width: 5),
                            const AppText(
                              text: "(4.0)",
                              color: Colors.grey,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        const AppLargeText(
                          text: "People",
                          color: Colors.black,
                          size: 22,
                        ),
                        const SizedBox(height: 10),
                        const AppText(
                          text: "Number of people in your group",
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButton(
                                  size: 50,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey.withOpacity(0.2),
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey.withOpacity(0.2),
                                  isIcons: false,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 10),
                        const AppLargeText(
                          text: "Description",
                          color: Colors.black,
                          size: 22,
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(
                          child: AppText(
                            text:
                                "Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....",
                            color: Colors.grey,
                          ),
                        ),
                      ]),
                )),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppButton(
                      color: Colors.black54,
                      backgroundColor: Colors.white,
                      size: 50,
                      borderColor: Colors.black54,
                      isIcons: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(width: 60),
                    ResponsiveButton(
                      isResponive: true,
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
