import 'package:flutter/material.dart';
import 'package:flutter_application_travel/colors.dart';
import 'package:flutter_application_travel/models/travelAPI.dart';
import 'package:flutter_application_travel/pages/detail_page.dart';
import 'package:flutter_application_travel/widgets/app_large_text.dart';
import 'package:flutter_application_travel/widgets/app_text.dart';

import '../models/travel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late List<Travel> _travel;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _travel = [];
    getData();
  }

  Future<void> getData() async {
    _travel = await TravelAPI.getTravel();
    setState(() {
      _isLoading = false;
    });
  }

  var images = {
    "bath.png": "bath",
    "food.png": "food",
    "pool.png": "pool",
    "wifi.png": "wifi",
  };
  var images1 = {
    "image1.png": "images1",
    "image2.png": "images1",
    "image3.png": "images1",
    "image4.png": "images1",
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.menu,
                size: 30,
                color: Colors.black,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5)),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const AppLargeText(
            text: "Discover",
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    CircleDedicator(color: AppColors.mainColor, radius: 4),
                tabs: const [
                  Tab(text: "Places"),
                  Tab(text: "Inspiration"),
                  Tab(text: "Emotions")
                ]),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20),
          height: 300,
          width: double.maxFinite,
          child: TabBarView(controller: tabController, children: [
            ListView.builder(
                //  itemCount: 4,
                itemCount: _travel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPage()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20, top: 10),
                      width: 180,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(
                              _travel[index].image,
                              //  "assets/images/${images1.keys.elementAt(index)}"
                            ),
                            fit: BoxFit.cover),
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 10, right: 10),
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: AppLargeText(
                                  // text: "Location",
                                  text: _travel[index].country,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            )
                          ]),
                    ),
                  );
                }),
            const Text("there"),
            const Text("byes"),
          ]),
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppLargeText(
                text: "Explore more",
                size: 22,
                color: Colors.black,
              ),
              AppText(
                text: "See all",
                size: 18,
                color: Colors.grey,
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 130,
          width: double.maxFinite,
          margin: const EdgeInsets.only(left: 20),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/${images.keys.elementAt(index)}"),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        child: AppText(
                          text: images.values.elementAt(index),
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ]),
    );
  }
}

class CircleDedicator extends Decoration {
  final Color color;
  double radius;
  CircleDedicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _circlePainter(color: color, radius: radius);
  }
}

class _circlePainter extends BoxPainter {
  final Color color;
  double radius;
  _circlePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset =
        Offset(configuration.size!.width / 2, configuration.size!.height);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
