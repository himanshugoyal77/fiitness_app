import 'dart:convert';

import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:fitness_application/drawer.dart';
import 'package:fitness_application/meal_detail.dart';
import 'package:fitness_application/meal_s.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List? popularQuote;

  @override
  void initState() {
    super.initState();
    ReadData();
  }

  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/popularQuote.json")
        .then((s) {
      setState(() {
        popularQuote = json.decode(s);
      });
    });
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
    return Scaffold(
      extendBody: true,
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
                  // color: Colors.black,
                ))),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            //color: Colors.black,
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
            // color: Colors.black,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      drawer: Mydrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 4,
          ),
          Row(children: [
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: const Text(
                "Fit & Care",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  //color: Colors.black,
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
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  for (int i = 0; i < meals.length; i++)
                    _MealCacrd(
                      meal: meals[i],
                    )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              // color: Colors.amber,
            ),
          )
        ],
      ),
    );
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
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
