import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'font_metadata_platform_interface.dart';

/// An implementation of [FontMetadataPlatform] that uses method channels.
class MethodChannelFontMetadata extends FontMetadataPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel("alibahareh.flutter.plugins.fontmetadata/channel");

  @override
  Future<String?> getFontName({String? path}) async {
    final fontName =
        await methodChannel.invokeMethod<String>('getFontName', {"path": path});
    return fontName;
  }
}
