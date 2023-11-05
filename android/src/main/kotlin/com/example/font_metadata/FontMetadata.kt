
import java.io.File
import org.apache.fontbox.ttf.TTFParser
import org.apache.fontbox.ttf.TrueTypeFont
import java.io.IOException

class FontMetadata {
    public fun getFontName(filePath: String?): String? {
        val file = File(filePath ?: "")
        val font: TrueTypeFont

        try {
            val ttfParser = TTFParser()
            font = ttfParser.parse(file)
        } catch (e: IOException) {
            e.printStackTrace()
            return null
        }

        val naming = font.naming
        val fontFamily = naming.fontFamily

        font.close()

        return fontFamily

    }
}