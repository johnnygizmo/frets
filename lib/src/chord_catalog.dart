import 'package:frets/frets.dart';
import 'package:frets/src/marker.dart';

enum ChordType {
  cMajorOpen,
  c7Open,
  majorMovable6thStringRoot,
  majorMovable5thStringRoot,
  cagedC,
  cagedA,
  cagedG,
  cagedE,
  cagedD,
}

typedef M = Marker;

extension ChordTypeExtension on ChordType {
  FretsChord get chord {
    switch (this) {
      case ChordType.cMajorOpen:
        return FretsChord(root: "C", markers: [
          [null, null, null, null, M(character: '1'), null],
          [null, M(character: '2'), null, null, null, null],
          [M(character: '3'), null, null, null, null, null],
        ]);
      // case ChordType.c7Open:
      //   return FretsChord(root: "C", extension: "7", markers: [
      //     ['', '', '', '', 'c1', ''],
      //     ['', 'C2', '', '', '', ''],
      //     ['c3', '', 'C4', '', '', ''],
      //     ['', '', '', '', '', ''],
      //     ['', '', '', '', '', ''],
      //   ]);
      // case ChordType.majorMovable6thStringRoot:
      // case ChordType.cagedE:
      //   return FretsChord(root: "Major", extension: "", markers: [
      //     ['c1', '', '', '', 'C1', 'c1'],
      //     ['', '', '', 'C2', '', ''],
      //     ['', 'C3', 'c4', '', '', ''],
      //     ['', '', '', '', '', ''],
      //     ['', '', '', '', '', ''],
      //   ]);
      // case ChordType.majorMovable5thStringRoot:
      // case ChordType.cagedA:
      //   return FretsChord(root: "Major", extension: "", markers: [
      //     ['', 'c1', '', '', '', 'C1'],
      //     ['', '', '', '', '', ''],
      //     ['', '', 'C2', 'c3', 'C4', ''],
      //     ['', '', '', '', '', ''],
      //     ['', '', '', '', '', ''],
      //   ]);

      default:
        throw Exception('Chord not found');
    }
  }
}
