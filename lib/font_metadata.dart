
import 'font_metadata_platform_interface.dart';

class FontMetadata {
  Future<String?> getPlatformVersion() {
    return FontMetadataPlatform.instance.getPlatformVersion();
  }
}
