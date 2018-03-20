import sys
import fontforge

for f in sys.argv[1:]:
    font = fontforge.open(f)
    try:
        font.removeGlyph(0xFB01)
        font.removeGlyph(0xFB02)
    except ValueError:
        continue
    font.generate(f + '.fix')
