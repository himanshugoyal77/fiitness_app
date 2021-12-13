import 'package:fitness_application/date_utils.dart';
import 'package:fitness_application/radial_progress.dart';
import 'package:fitness_application/top_bar.dart';
import 'package:fitness_application/top_bar.dart';
import 'package:fitness_application/top_bar.dart';
import 'package:flutter/material.dart';

class Daypro extends StatefulWidget {
  const Daypro({Key? key}) : super(key: key);

  @override
  State<Daypro> createState() => _DayproState();
}

class _DayproState extends State<Daypro> {
  DateTime selectedDate = DateTime.now();
  _AddDate() {
    selectedDate = selectedDate.add(Duration(days: 1));
  }

  _substactDate() {
    selectedDate = selectedDate.subtract(Duration(days: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TopBar(),
          Positioned(
            top: 10,
            left: 5,
            right: 5,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _substactDate();
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 28,
                    )),
                Expanded(
                  child: Column(
                    children: [
                      Text(formatterDayOfWeek.format(selectedDate),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 28,
                            // letterSpacing: 1.2),
                          )),
                      Text(formatterDate.format(selectedDate),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            // letterSpacing: 1.2),
                          )),
                    ],
                  ),
                ),
                Transform.rotate(
                  angle: 135,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _AddDate();
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 28,
                      )),
                ),
              ],
            ),
          ),
          Positioned(
              top: 100, left: 80, child: Container(child: RadialProgress())),
        ],
      ),
    );
  }
}
