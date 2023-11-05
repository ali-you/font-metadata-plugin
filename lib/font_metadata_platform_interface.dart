import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'font_metadata_method_channel.dart';

abstract class FontMetadataPlatform extends PlatformInterface {
  /// Constructs a FontMetadataPlatform.
  FontMetadataPlatform() : super(token: _token);

  static final Object _token = Object();

  static FontMetadataPlatform _instance = MethodChannelFontMetadata();

  /// The default instance of [FontMetadataPlatform] to use.
  ///
  /// Defaults to [MethodChannelFontMetadata].
  static FontMetadataPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FontMetadataPlatform] when
  /// they register themselves.
  static set instance(FontMetadataPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getFontName({String? path}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
