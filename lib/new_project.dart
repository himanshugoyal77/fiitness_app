import 'package:fitness_application/drawer.dart';
import 'package:fitness_application/exercise_widget.dart';
import 'package:flutter/material.dart';

class MySlivevrApp extends StatelessWidget {
  const MySlivevrApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            buildAppBar(context),
            // exercisewidget(),
          ],
        ),
      ),
    );
  }

  SliverAppBar buildAppBar(BuildContext context) => SliverAppBar(
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            "assets/img/bbb4.jpg",
            fit: BoxFit.cover,
          ),
          stretchModes: const [StretchMode.blurBackground],
        ),
        title: const Text("statistics"),
        centerTitle: true,
        expandedHeight: MediaQuery.of(context).size.height * 0.6,
        stretch: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: const [
          Icon(Icons.person_rounded),
          SizedBox(
            width: 12,
          )
        ],
      );
}
