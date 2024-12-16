import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

enum MarkerShape { circle, square, triangle, diamond }

class Marker {
  Marker(
      {this.radius,
      this.bgColor,
      this.borderColor,
      this.borderSize,
      this.textColor,
      this.fontFamily,
      this.shape,
      this.character});

  int? radius;
  Color? bgColor;
  Color? borderColor;
  int? borderSize;
  Color? textColor;
  String? fontFamily;
  MarkerShape? shape;
  String? character;
}
