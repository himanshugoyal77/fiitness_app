import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/drawer.dart';
import 'package:flutter_new/fit_app/meal_detail.dart';
import 'package:flutter_new/fit_app/meal_s.dart';
import 'package:flutter_new/fit_app/work_screen.dart';
import 'package:flutter_new/login_page.dart';
import 'package:flutter_new/values/colors.dart';

class Page2 extends StatefulWidget {
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<String> imgList = [
    'assets/img/bb1.jpg',
    'assets/img/bb2.jpg',
    'assets/img/bb3.jpg',
    'assets/img/bb4.jpg',
    'assets/img/bb5.jpg',
    'assets/img/bb6.jpg',
    'assets/img/bb7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // final UserName = FinalName;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ))),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.black,
            ),
            //  IconButton (
            //    icon: Icons.search,
            //     color: Colors.black,
            //   ),
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.light_mode,
              color: Colors.black,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        //drawer: Mydrawer(),
        body: Column(children: [
          const SizedBox(
            height: 4,
          ),
          Row(children: [
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Text(
                "Fit & Care",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ]),
          const SizedBox(
            height: 14,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 12,
              autoPlayCurve: Curves.decelerate,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: imgList
                .map((item) => Container(
                      margin: const EdgeInsets.only(right: 0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(item), fit: BoxFit.cover)),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(children: [
            Container(
              // height: 0.18,
              padding: const EdgeInsets.only(bottom: 5),
              margin: const EdgeInsets.only(left: 15),
              child: const Text(
                "MEALS FOR TODAY",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  //color: Colors.black,
                ),
              ),
            ),
          ]),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                    for (int i = 0; i < meals.length; i++)
                      _MealCacrd(
                        meal: meals[i],
                      )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 50, top: 5),
              //padding: const EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[100],
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WorkoutScreen()));
                },
                child: ListView(children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "START YOUR WARMUP",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            const Text(
                              "Go to WarmUP",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),

                            Row(
                              children: [
                                Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black87,
                                    ),
                                    child: Image.asset(
                                      "assets/img/pose3.png",
                                      //color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black87,
                                    ),
                                    child: Image.asset(
                                      "assets/img/pose1.png",
                                      //color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black87,
                                    ),
                                    child: Image.asset(
                                      "assets/img/pose2.png",
                                      //  color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                // Container(
                                //     height: 50,
                                //     width: 50,
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(15),
                                //       //  color: Colors.black87,
                                //     ),
                                //     child: Image.asset(
                                //       "assets/img/pose3.png",
                                //       //  color: Colors.white,
                                //     )),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                              //margin: EdgeInsets.all(5),
                              height: 130,
                              width: MediaQuery.of(context).size.width * 0.41,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // color: Colors.black87,
                              ),
                              child: Image.asset(
                                "assets/img/yoga.png",

                                //  color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ]));
  }
}

class _MealCacrd extends StatelessWidget {
  final Meal meal;
  const _MealCacrd({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        right: 12,
        bottom: 0,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MealDetailScreen(meal: meal)));
        },
        child: Material(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          elevation: 4,
          child: Column(
            // mainAxisAlignment: MainAxisSize.max,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: OpenContainer(
                    closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    transitionDuration: const Duration(milliseconds: 500),
                    openBuilder: (context, action) {
                      return MealDetailScreen(meal: meal);
                    },
                    closedBuilder: (context, OpenContainer) {
                      return GestureDetector(
                        onTap: OpenContainer,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20)),
                            child: Image.asset(
                              meal.imagePath,
                              width: 150,
                              fit: BoxFit.fill,
                            )),
                      );
                    }),
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          meal.mealTime,
                          style: const TextStyle(color: Colors.black87),
                        ),
                        Text(
                          meal.name,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.health_and_safety,
                              color: Colors.black,
                            ),
                            Text(
                              " ${meal.kiloCaloriesBurnt} Kcal",
                              style: const TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
