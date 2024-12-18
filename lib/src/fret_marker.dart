import 'package:flutter/material.dart';

/// An enum that represents the shape of a marker.
enum MarkerShape { circle, square, triangle, diamond, none }

/// A class that represents a marker on the fretboard.
class FretMarker {
  FretMarker(
      {required this.string,
      required this.fret,
      this.radius,
      this.barre,
      this.bgColor,
      this.borderColor,
      this.borderSize,
      this.textColor,
      this.fontFamily,
      this.shape,
      this.text});

  /// The radius of the marker.
  int? radius;

  /// The length of the barre marker in strings covered.
  ///
  /// If null the barre will cover all remaining strings. A value of 1 will
  /// cover the current string only. If the barre is longer than available,
  /// it will be drawn from the current string to the end of the fretboard.
  int? barre;

  /// The background color of the marker.
  Color? bgColor;

  /// The border color of the marker.
  Color? borderColor;

  /// The border size of the marker.
  int? borderSize;

  /// The text color of the marker.
  Color? textColor;

  /// The font family of the marker.
  String? fontFamily;

  /// The shape of the marker.
  MarkerShape? shape;

  /// The text of the marker.
  String? text;

  int string;
  int fret;

  /// Creates a copy of this marker but with the given fields replaced with the new values.
  FretMarker copyWith({
    int? radius,
    Color? bgColor,
    Color? borderColor,
    int? borderSize,
    Color? textColor,
    String? fontFamily,
    MarkerShape? shape,
    String? text,
    int? string,
    int? fret,
    int? barreLength,
  }) {
    return FretMarker(
      string: string ?? this.string,
      fret: fret ?? this.fret,
      radius: radius ?? this.radius,
      barre: barreLength ?? this.barre,
      bgColor: bgColor ?? this.bgColor,
      borderColor: borderColor ?? this.borderColor,
      borderSize: borderSize ?? this.borderSize,
      textColor: textColor ?? this.textColor,
      fontFamily: fontFamily ?? this.fontFamily,
      shape: shape ?? this.shape,
      text: text ?? this.text,
    );
  }
}
