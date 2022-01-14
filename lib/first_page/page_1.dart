import 'package:flutter/material.dart';
import 'package:flutter_new/fit_app/page_2.dart';

import 'package:flutter_new/fit_app/work_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  var ImgList = [
    "assets/img/chest.png",
    "assets/img/biceps.png",
    "assets/img/bbb3.jpg",
    "assets/img/bbb4.jpg",
    "assets/img/bbb3.jpg",
    "assets/img/bbb1.jpg",
    "assets/img/bbb4.jpg",
  ];

  var TitleList = [
    "WarmUp Exercise 1",
    "WarmUp Exercise 2",
    "WarmUp Exercise 3",
    "WarmUp Exercise 4",
    "WarmUp Exercise 5",
    "WarmUp Exercise 6",
    "WarmUp Exercise 7",
    "WarmUp Exercise 8"
  ];

  var DescList = [
    "move your lower body in \ncircular direction",
    "move your lower body in \ncircular direction",
    "move your lower body in \ncircular direction",
    "move your lower body in \ncircular direction",
    "move your lower body in \ncircular direction",
    "move your lower body in \ncircular direction",
    "move your lower body in \ncircular direction",
    "move your lower body in \ncircular direction",
  ];

  @override
  Widget build(BuildContext context) {
    // Task task1;
    // final TaskList = Task.generateTasks();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    //"assets/img/bb1.jpg",
                    "assets/img/propic.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              const Text(
                "HI USER!",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ],
          ),
          actions: const [
            Icon(
              Icons.more_horiz,
              color: Colors.black,
              size: 40,
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                height: 145,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey[800], shape: BoxShape.circle),
                      child: const Icon(
                        Icons.star,
                        // color: Colors.black,
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Set A Goal",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Enter your Target\ncomplete the Task\nGet Rrewarded",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[400]),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 18,
                  right: 18,
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.deepPurple),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 8),
            child: Text(
              "Tasks",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: ListView(physics: BouncingScrollPhysics(), children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //  crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  showDialog1(context);
                                },
                                child: Card1(context)),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                                onTap: () {
                                  showDialog2(context);
                                },
                                child: Card2(context)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //  crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  showDialog3(context);
                                },
                                child: Card3(context)),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                                onTap: () {
                                  showDialog4(context);
                                },
                                child: Card4(context)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //  crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  showDialog5(context);
                                },
                                child: Card5(context)),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                                onTap: () {
                                  showDialog6(context);
                                },
                                child: Card6(context)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          )
        ]));
  }
}

Widget Card1(context) {
  return Container(
      height: 160,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: AssetImage(
                "assets/img/AbDay.jpg",
              ),
              fit: BoxFit.contain)));
}

Widget Card2(context) {
  return Container(
    height: 160,
    width: MediaQuery.of(context).size.width * 0.4,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: AssetImage("assets/img/shoulderDay.jpg"),
            fit: BoxFit.contain)),
  );
}

Widget Card3(context) {
  return Container(
    height: 160,
    width: MediaQuery.of(context).size.width * 0.4,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: AssetImage("assets/img/chestDAy.jpg"), fit: BoxFit.contain)),
  );
}

Widget Card4(context) {
  return Container(
    height: 160,
    width: MediaQuery.of(context).size.width * 0.4,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: AssetImage("assets/img/armDay.jpg"), fit: BoxFit.contain)),
  );
}

Widget Card5(context) {
  return Container(
    height: 160,
    width: MediaQuery.of(context).size.width * 0.4,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[300]!, blurRadius: 7, offset: Offset(0, 7))
        ],
        image: const DecorationImage(
            image: AssetImage("assets/img/BackDAy.jpg"), fit: BoxFit.contain)),
  );
}

Widget Card6(context) {
  return Container(
    height: 160,
    width: MediaQuery.of(context).size.width * 0.4,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: AssetImage("assets/img/legDay.jpg"), fit: BoxFit.contain)),
  );
}

showDialog1(context) {
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
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/img/AbDay.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple)),
                  onPressed: () {
                    launch("https://youtu.be/Ta8_ASDu9yk");
                  },
                  child: const Text(
                    "Video Tutorial",
                  ),
                )
              ],
            ),
          ),
        ));
      });
}

showDialog2(context) {
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
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/img/shoulderDay.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple)),
                  onPressed: () {
                    launch("https://youtu.be/xnrJCzlOpS8");
                  },
                  child: const Text(
                    "Video Tutorial",
                  ),
                )
              ],
            ),
          ),
        ));
      });
}

showDialog3(context) {
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
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/img/chestDAy.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple)),
                  onPressed: () {
                    launch("https://youtu.be/lWXhih3xbVc");
                  },
                  child: const Text(
                    "Video Tutorial",
                  ),
                )
              ],
            ),
          ),
        ));
      });
}

showDialog4(context) {
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
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/img/armDay.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple)),
                  onPressed: () {
                    launch("https://youtu.be/cxFPw0fu_KA");
                  },
                  child: const Text(
                    "Video Tutorial",
                  ),
                )
              ],
            ),
          ),
        ));
      });
}

showDialog5(context) {
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
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/img/BackDAy.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple)),
                  onPressed: () {
                    launch("https://youtu.be/s8taXR3mYa8");
                  },
                  child: const Text(
                    "Video Tutorial",
                  ),
                )
              ],
            ),
          ),
        ));
      });
}

showDialog6(context) {
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
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/img/legDay.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple)),
                  onPressed: () {
                    launch("https://youtu.be/RjexvOAsVtI");
                  },
                  child: const Text(
                    "Video Tutorial",
                  ),
                )
              ],
            ),
          ),
        ));
      });
}
