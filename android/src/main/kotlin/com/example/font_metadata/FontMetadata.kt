
import java.io.File
import org.apache.fontbox.ttf.TTFParser
import org.apache.fontbox.ttf.TrueTypeFont
import java.io.IOException

class FontMetadata {
    public fun getFontName(filePath: String?): String? {
        try {
            val file = File(filePath ?: "")
            val font: TrueTypeFont
            val ttfParser = TTFParser()
            font = ttfParser.parse(file)
            val naming = font.naming
            val fontFamily = naming.fontFamily
            font.close()
            return fontFamily
        } catch (e: IOException) {
            e.printStackTrace()
            return null
        } catch (e: Exception){
            e.printStackTrace()
            return null
        }
        return  null
    }
}