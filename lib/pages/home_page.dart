import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/first_page/page_1.dart';
import 'package:flutter_new/fit_app/page_2.dart';
import 'package:flutter_new/task.dart/page_3.dart';
import 'package:flutter_new/widgets/view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1;
  final items = [
    const Icon(Icons.task, color: Colors.black, size: 30),
    const Icon(Icons.home, color: Colors.black, size: 30),
    const Icon(Icons.schedule, color: Colors.black, size: 30),
  ];

  final screens = [Page1(), Page2(), Page3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.deepPurple,
          animationDuration: Duration(milliseconds: 300),
          height: 60,
          index: index,
          items: items,
          onTap: (index) => setState(() {
                this.index = index;
              })),
    );
  }
}
