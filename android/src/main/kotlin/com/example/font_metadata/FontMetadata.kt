import org.apache.fontbox.ttf.OTFParser
import org.apache.fontbox.ttf.TTFParser
import java.io.File

class FontMetadata {
    public fun getFontName(filePath: String?): String? {
        val file = File(filePath ?: "")
        try {
            val ttfParser = TTFParser()
            val font = ttfParser.parse(file)
            val naming = font.naming
            val fontFamily = naming.fontFamily
            font.close()
            return fontFamily
        } catch (e: Exception) {
            e.printStackTrace()
        }

        try {
            val otfParser = OTFParser()
            val font = otfParser.parse(filePath)
            val naming = font.naming
            val fontFamily = naming.fontFamily
            font.close()
            return fontFamily
        } catch (e: Exception) {
            e.printStackTrace()
        }

        return null
    }
}