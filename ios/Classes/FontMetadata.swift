import CoreText
import CoreGraphics
import Foundation

class FontMetadata {

    var path: URL

    init(path: String) {
        self.path = URL(string: path)!
    }

    public func getFontName() -> String? {

        guard let fontDataProvider = CGDataProvider(url: path as CFURL) else {
            return nil
        }

        if let newFont = CGFont(fontDataProvider) {
            let newFontName = newFont.fullName
            return newFontName as? String
        }

        return nil

    }

}