import 'font_metadata_platform_interface.dart';

class FontMetadata {
  final String _path;

  FontMetadata(this._path);

  Future<String?> getFontName() {
    return FontMetadataPlatform.instance.getFontName(path: _path);
  }
}
