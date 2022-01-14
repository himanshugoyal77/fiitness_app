// import 'dart:async';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_new/pages/home_page.dart';
// import 'package:flutter_new/pages/page_1.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// String? FinalName;

// class LoginPage extends StatefulWidget {
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final UserNameController = TextEditingController();
//   String name = "";
//   //String? name;
//   bool changeButton = false;
//   final _formkey = GlobalKey<FormState>();
//   @override
//   void initState() {
//     getValidationData().whenComplete(() async {
//       Timer(
//           Duration(seconds: 3),
//           () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) =>
//                       FinalName == 0 ? LoginPage() : HomePage())));
//     });
//   }

//   // moveToHome(BuildContext context) async {
//   //   if (_formkey.currentState!.validate()) {
//   //     setState(() {
//   //       changeButton = true;
//   //     });

//   //     await Future.delayed(Duration(milliseconds: 5));
//   //     await Navigator.push(
//   //         context, MaterialPageRoute(builder: (context) => HomePage()));
//   //     setState(() {
//   //       changeButton = false;
//   //     });
//   //   }
//   // }

//   Future getValidationData() async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     var ObtainedData = sharedPreferences.getString("UserName");
//     setState(() {
//       FinalName = ObtainedData;
//     });
//     print(FinalName);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: Material(
//                 color: Colors.white,
//                 child: SingleChildScrollView(
//                     child: Form(
//                   key: _formkey,
//                   child: Column(
//                     children: [
//                       Image.asset(
//                         "assets/img/login.png.png",
//                         fit: BoxFit.cover,
//                         height: 270,
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       Text(
//                         "welcome $name",
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 18.0, horizontal: 32.0),
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               controller: UserNameController,
//                               decoration: InputDecoration(
//                                   hintText: "Enter Username",
//                                   labelText: "username"),
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "userName Is Empty";
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {
//                                 name = value;
//                                 setState(() {});
//                               },
//                             ),
//                             TextFormField(
//                               obscureText: true,
//                               decoration: InputDecoration(
//                                   hintText: "Enter Password",
//                                   labelText: "Password"),
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "Password Is Empty";
//                                 } else if (value.length < 6) {
//                                   return "Password must be 6 characters";
//                                 }
//                                 return null;
//                               },
//                             ),
//                             SizedBox(
//                               height: 40.0,
//                             ),
//                             Material(
//                               color: Colors.deepPurple,
//                               borderRadius:
//                                   BorderRadius.circular(changeButton ? 70 : 8),
//                               child: InkWell(
//                                 onTap: () async {
//                                   final SharedPreferences sharedPreferences =
//                                       await SharedPreferences.getInstance();
//                                   sharedPreferences.setString(
//                                       'UserName', UserNameController.text);
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => HomePage()));
//                                 },
//                                 //moveToHome(context),
//                                 child: AnimatedContainer(
//                                   duration: Duration(seconds: 0),
//                                   width: changeButton ? 70 : 130,
//                                   height: 40,
//                                   alignment: Alignment.center,
//                                   child: changeButton
//                                       ? Icon(Icons.done, color: Colors.white)
//                                       : Text(
//                                           "login",
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 18),
//                                         ),

//                                   //  shape: changeButton? BoxShape.circle:BoxShape.rectangle,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             GestureDetector(
//                                 onTap: () {},
//                                 child: Text("Already registerd?")),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 )))));
//   }
// }
