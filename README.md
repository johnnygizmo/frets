Create fretboard block diagrams for all sorts of stringed instruments.

## Features

Control the title, number of strings and frets, and starting fret For each marker, control the shape and size, 
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


