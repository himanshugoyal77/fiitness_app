import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkoutScreen extends StatefulWidget {
  WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  var titleList = [
    "WarmUp Exercise 1",
    "WarmUp Exercise 2",
    "WarmUp Exercise 3",
    "WarmUp Exercise 4",
    "WarmUp Exercise 5",
    "WarmUp Exercise 6",
    "WarmUp Exercise 7",
    "WarmUp Exercise 8"
  ];

  var descList = [
    "move your lower body in circular direction",
    "move your lower body in circular direction",
    "move your lower body in circular direction",
    "move your lower body in circular direction",
    "move your lower body in circular direction",
    "move your lower body in circular direction",
    "move your lower body in circular direction",
    "move your lower body in circular direction",
  ];

  var imgList = [
    "assets/img/we1.jpg",
    "assets/img/we2.jpg",
    "assets/img/we3.jpg",
    "assets/img/we4.jpg",
    "assets/img/we5.jpg",
    "assets/img/we6.jpg",
    "assets/img/we7.jpg",
    "assets/img/we8.jpg",
  ];

  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30, right: 16, left: 16, bottom: 12),
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close, color: Colors.black, size: 40)),
            // const SizedBox(
            //   height: 10,
            // ),
            ListTile(
              leading: Text(
                "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMM").format(today)}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: imgList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      showDialogf(context, imgList[index], titleList[index],
                          descList[index]);
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              imgList[index],
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  titleList[index],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: width,
                                  child: Text(
                                    descList[index],
                                    style: TextStyle(
                                        fontSize: 14,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showDialogf(context, img, title, desc) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            padding: EdgeInsets.all(18),
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.48,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    img,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
        ));
      });
}
