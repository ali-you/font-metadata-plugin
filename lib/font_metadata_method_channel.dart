import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'font_metadata_platform_interface.dart';

/// An implementation of [FontMetadataPlatform] that uses method channels.
class MethodChannelFontMetadata extends FontMetadataPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('font_metadata');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
