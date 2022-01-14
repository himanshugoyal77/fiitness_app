// // ignore_for_file: unused_element

// import 'package:flutter/cupertino.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_new/login_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Mydrawer extends StatefulWidget {
//   @override
//   State<Mydrawer> createState() => _MydrawerState();
// }

// class _MydrawerState extends State<Mydrawer> {
//   String name = "";
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//           color: Colors.amber,
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               DrawerHeader(
//                 padding: EdgeInsets.zero,
//                 child: UserAccountsDrawerHeader(
//                     margin: EdgeInsets.zero,
//                     decoration: BoxDecoration(color: Colors.blue),
//                     accountName: Text(
//                       "$FinalName",
//                     ),
//                     accountEmail: const Text("NewUser123@gmail.com"),
//                     currentAccountPicture: CircleAvatar(
//                         // backgroundImage: AssetImage("assets/img/YourName1.jpg"),
//                         )),
//               ),
//               ListTile(
//                 leading: Icon(
//                   CupertinoIcons.home,
//                   color: Colors.black,
//                 ),
//                 title: Text(
//                   "Home",
//                   textScaleFactor: 1.2,
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 0.0, horizontal: 6.0)),
//               ListTile(
//                 leading: Icon(
//                   CupertinoIcons.profile_circled,
//                   color: Colors.black,
//                 ),
//                 title: Text(
//                   "Profile",
//                   textScaleFactor: 1.2,
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 leading: Icon(
//                   CupertinoIcons.mail,
//                   color: Colors.black,
//                 ),
//                 title: Text(
//                   "Mail",
//                   textScaleFactor: 1.2,
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               MaterialButton(
//                 onPressed: () async {
//                   final SharedPreferences sharedPreferences =
//                       await SharedPreferences.getInstance();
//                   sharedPreferences.remove('UserName');
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (contet) => LoginPage()));
//                 },
//                 child: Container(
//                   height: 50,
//                   width: 120,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.blue,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "LogOut",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }
