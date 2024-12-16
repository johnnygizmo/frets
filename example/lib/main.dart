import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frets/frets.dart';
import 'dart:html' as html;


typedef M = Marker;

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Frets Example App'),
          backgroundColor: Colors.blue,
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey _globalKey = GlobalKey();

  Future<void> _capturePng() async {
    try {
      RenderRepaintBoundary? boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;

      ui.Image image = await boundary!.toImage(pixelRatio: 2);

      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      Uint8List pngBytes = byteData!.buffer.asUint8List();
      final blob = html.Blob([pngBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "frets.png")
        ..click();
      html.Url.revokeObjectUrl(url);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Frets(
                        root: "Major Chord - A Shape",
                        width: 300,
                        height: 300,
                        headerSize: 20,
                        openMarkers: [
                          M(
                              text: "X",
                              radius: 26,
                              bgColor: Colors.transparent,
                              textColor: Colors.black)
                        ],
                        markers: [
                          [null, Mark.b1],
                          [],
                          [null, null,Mark.b3, null, null, null],
                        ]),
                        Frets(
                        root: "C",
                        extension: "maj7",
                        width: 300,
                        height: 300,
                        headerSize: 40,
                        openMarkers: [
                          M(
                              text: "X",
                              radius: 26,
                              bgColor: Colors.transparent,
                              textColor: Colors.black)
                        ],
                        markers: [
                  [],
                          [null, null, Mark.c2, null, null, null],
                          [null,Mark.c3, null, null, null, null],
                        ]),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Frets(
                root: "Major Chord - E Shape",
                 headerSize: 20,
                width: 300,
                height: 300,
                markers: [
                  [M(shape: MarkerShape.barre,text: "1")],
                  [null, null, null,Mark.c2, null,  null],
                  [null, Mark.c3i, Mark.c4, null, null, null],
                  [null, null, null, null, null, null],
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: _capturePng,
            child: Text('Save as PNG'),
          ),
        ],
      ),
    );
  }
}
