export 'data/font_asset_source.dart';
export 'data/font_data_source.dart';
export 'data/font_file_source.dart';

import 'package:font_metadata/data/font_file_source.dart';
import 'package:font_metadata/data/font_source.dart';
import 'font_metadata_platform_interface.dart';

class FontMetadata {
  // final FontSource _path;
  //
  // FontMetadata(this._path);

  final FontSource _fontSource;
  FontMetadata(this._fontSource);

  // Future<String?> getFontName() {
  //   return FontMetadataPlatform.instance.getFontName(path: _path);
  // }


Future<String?> getFontName() {

  print(_fontSource.runtimeType);

  switch (_fontSource.runtimeType){
    case FontFileSource:
      FontFileSource fileSource = _fontSource as FontFileSource;
      return FontMetadataPlatform.instance.getFontName(path: fileSource.path);

      default: throw "runtime Type error";
  }


}

}
