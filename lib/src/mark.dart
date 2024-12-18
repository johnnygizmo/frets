import 'package:flutter/material.dart';
import 'package:frets/frets.dart';
import 'package:frets/src/fret_marker.dart';

class Mark {

  static Marker b1 = Marker(barreLength: 2, text: "1");
  static Marker b2 = Marker(barreLength: 2, text: "2");
  static Marker b3 = Marker(barreLength: 2, text: "3");
  static Marker b4 = Marker(barreLength: 2, text: "4");

  static Marker c1 = Marker(text: "1");
  static Marker c2 = Marker(text: "2");
  static Marker c3 = Marker(text: "3");
  static Marker c4 = Marker(text: "4");

  static Marker c1i = Marker(text: "1",bgColor: Colors.white,borderColor: Colors.black,textColor: Colors.black,borderSize: 2);
  static Marker c2i = Marker(text: "2",bgColor: Colors.white,borderColor: Colors.black,textColor: Colors.black,borderSize: 2);
  static Marker c3i = Marker(text: "3",bgColor: Colors.white,borderColor: Colors.black,textColor: Colors.black,borderSize: 2);
  static Marker c4i = Marker(text: "4",bgColor: Colors.white,borderColor: Colors.black,textColor: Colors.black,borderSize: 2);

}