import 'package:flutter_test/flutter_test.dart';
import 'package:font_metadata/font_metadata.dart';
import 'package:font_metadata/font_metadata_platform_interface.dart';
import 'package:font_metadata/font_metadata_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFontMetadataPlatform
    with MockPlatformInterfaceMixin
    implements FontMetadataPlatform {
  @override
  Future<String?> getFontName({String? path}) {
    // TODO: implement getFontName
    throw UnimplementedError();
  }
}

void main() {
  final FontMetadataPlatform initialPlatform = FontMetadataPlatform.instance;

  test('$MethodChannelFontMetadata is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFontMetadata>());
  });

  test('getPlatformVersion', () async {
    FontMetadata fontMetadataPlugin = FontMetadata("/data/user/0/com.example.font_metadata_example/cache/file_picker/B-NAZANIN.TTF");
    MockFontMetadataPlatform fakePlatform = MockFontMetadataPlatform();
    FontMetadataPlatform.instance = fakePlatform;

    expect(await fontMetadataPlugin.getFontName(), '42');
  });
}
