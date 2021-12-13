import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitness_application/days_progress.dart';

import 'package:fitness_application/drawer.dart';

import 'package:fitness_application/home_page.dart';
import 'package:fitness_application/new_project.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late BannerAd bannerAd;
  bool isLoaded = false;
  final NavigationKey = GlobalKey<CurvedNavigationBarState>();
  int index1 = 1;
  final screens = [
    Daypro(),
    // MyTodo(),
    MyHomePage(),
    MySlivevrApp(),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: BannerAd.testAdUnitId,
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          isLoaded = true;
        });
        print("Ad loaded");
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
      }),
      request: AdRequest(),
    );
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.person,
        size: 30,
        // color: Colors.black,
      ),
      const Icon(
        Icons.home,
        size: 30,
        // color: Colors.black,
      ),
      const Icon(
        Icons.favorite,
        size: 30,
        //color: Colors.black,
      ),
    ];
    return MaterialApp(
        title: "My fitness App",
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
        darkTheme: ThemeData(
            primaryColor: Colors.red.shade800, brightness: Brightness.dark),
        themeMode: ThemeMode.dark,
        home: Scaffold(
          extendBody: true,
          body: screens[index1],
          drawer: Mydrawer(),
          bottomNavigationBar: CurvedNavigationBar(
            key: NavigationKey,
            backgroundColor: Colors.transparent,
            color: Colors.black26,
            height: 55,
            items: items,
            index: index1,
            onTap: (index) => setState(() => this.index1 = index),
          ),
        ));
  }
}
