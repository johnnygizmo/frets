import 'package:frets/src/marker.dart';

class FretsChord {
  final String root;
  final String? extension;
  final int? startFret;

  final List<List<Marker?>> markers;
  final List<String>? openMarkers;

  FretsChord({
    required this.root,
    this.extension,
    required this.markers,
    this.openMarkers,
    this.startFret,
  });
}
