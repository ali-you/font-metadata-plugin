import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:font_metadata/font_metadata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _fontName = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(type: FileType.any);
                  if (result != null) {
                    File file = File(result.files.single.path!);
                    String extension =
                        (file.path.split('.').last).toLowerCase();
                    if (extension == 'ttf' || extension == 'otf') {
                      if (mounted) {
                        FontMetadata fontMetadata =
                            FontMetadata(FontFileSource(path: Platform.isIOS ? result.files.single.identifier! : file.path));


                        _fontName = await fontMetadata.getFontName() ?? "";
                        setState(() {});
                      }
                    }
                  }
                },
                child: const Text("Select font file"),
              ),
              Text("Font name: $_fontName")
            ],
          ),
        ),
      ),
    );
  }
}
