# font_metadata

A Flutter plugin to get .ttf, .otf files metadata

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Release tips

if use progaurd, you must to add:
```
-keep class org.apache.fontbox.ttf.** { *; }
-keep class org.apache.commons.logging.** { *; }
```
to progaurd-rules.pro file

