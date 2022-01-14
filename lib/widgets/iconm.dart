import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/values/colors.dart';
import 'package:flutter_new/values/icons.dart';

List<Icon> getIcons() {
  return const [
    Icon(
      IconData(personIcon, fontFamily: 'MaterialIcons'),
      color: purple,
    ),
    Icon(
      IconData(WorkIcon, fontFamily: 'MaterialIcons'),
      color: pink,
    ),
    Icon(
      IconData(movieICon, fontFamily: 'MaterialIcons'),
      color: green,
    ),
    Icon(
      IconData(sportIcon, fontFamily: 'MaterialIcons'),
      color: yellow,
    ),
    Icon(
      IconData(travelIcon, fontFamily: 'MaterialIcons'),
      color: deepPink,
    ),
    Icon(
      IconData(shopIcon, fontFamily: 'MaterialIcons'),
      color: LightBLue,
    ),
  ];
}

// const personIcon = 0xe491;
// const WorkIcon = 0xe11c;
// const movieICon = 0xe40f;
// const sportIcon = 0xc3dc;
// const travelIcon = 0xe071;
// const shopIcon = 0xe59c;

