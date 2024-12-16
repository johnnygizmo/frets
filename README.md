<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

Create fretboard block diagrams for all sorts of stringed instruments. Control the title, number of strings and frets, starting fret, marker shape and size, 
font, text colors, etc.

## Getting started

To use this plugin, add `frets` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/). 
  
See the example to get started quickly. To generate the platform folders run:

```dart
flutter create .
```

in the example folder.

## Usage

Add a Frets widget to your widget tree.

```dart
Frets(
      root: "C",
      markers: [
        [null, null, null, null, null, null],
        [null, null, Marker(character: '2'), null, null, null],
        [null, Marker(character: '3'), null, null, null, null],
      ]),
),
```

## Additional information


