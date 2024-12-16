import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:frets/frets.dart';
import 'dart:html' as html;

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
    var m1 = M(character: "1");
    var m1r = M(character: "1", bgColor: Colors.grey, borderSize: 2);
    var m2b = M(
        character: "2",
        bgColor: Colors.blue,
        textColor: Colors.black,
        borderSize: 2);
    var m4b = M(
        character: "4",
        bgColor: Colors.blue,
        textColor: Colors.black,
        borderSize: 2);
    var m3 = M(character: "3");
    var m3r = M(character: "3", bgColor: Colors.grey, borderSize: 2);
    var m4 = M(character: "4");

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
                child: Frets(
                    root: "C",
                    extension: "maj7",
                    width: 300,
                    height: 300,
                    headerSize: 40,
                    openMarkers: [
                      M(
                          character: "X",
                          radius: 26,
                          bgColor: Colors.transparent,
                          textColor: Colors.black)
                    ],
                    markers: [
                      [null, null, null, null, null, null],
                      [null, null, M(character: '2'), null, null, null],
                      [null, M(character: '3'), null, null, null, null],
                    ]),
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
                root: "Minor Blues Scale",
                headerSize: 30,
                width: 300,
                height: 300,
                markers: [
                  [m1r, m1, m1, m1, m1, m1r],
                  [null, m2b, null, null, null, null],
                  [null, m3, m3r, m3, null, null],
                  [m4, null, null, m4b, m4, m4]
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
