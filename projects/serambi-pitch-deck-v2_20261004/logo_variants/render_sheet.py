#!/usr/bin/env python3
"""Render logo variants on light + dark backgrounds and compose a contact sheet."""
import io
import sys
from pathlib import Path

import cairosvg
from PIL import Image, ImageDraw, ImageFont

VARIANTS = [
    ("v1-serambi-gate.svg", "V1 — Serambi Gate", "the porch arch: threshold into a new career"),
    ("v2-stepping-stones.svg", "V2 — Stepping Stones", "scaffolded path rising toward the goal"),
    ("v3-s-path.svg", "V3 — The S-Path", "the letter S that is also the journey"),
    ("v4-staircase.svg", "V4 — Staircase", "each step placed by the guide"),
    ("v5-cognitive-mirror.svg", "V5 — Cognitive Mirror", "learner at core, feedback echoing out"),
    ("v6-agent-constellation.svg", "V6 — Agent Constellation", "1 guide + 5 specialist agents"),
    ("v7-house-doorway.svg", "V7 — House & Doorway", "the career home, serambi stands open"),
]

BLUE = (30, 39, 97)      # #1E2761
WHITE = (255, 255, 255)

def render(svg_text: str, color_rgb, bg_rgb, size=440) -> Image.Image:
    svg_text = svg_text.replace("currentColor", f"#{color_rgb[0]:02x}{color_rgb[1]:02x}{color_rgb[2]:02x}")
    png = cairosvg.svg2png(bytestring=svg_text.encode(), output_width=size, output_height=size)
    if png is None:  # pragma: no cover - defensive
        raise RuntimeError("cairosvg returned no image data")
    img = Image.open(io.BytesIO(png)).convert("RGBA")
    canvas = Image.new("RGBA", img.size, bg_rgb + (255,))
    canvas.alpha_composite(img)
    return canvas

def main():
    base = Path(sys.argv[1])
    cell_w, cell_h = 440, 440
    label_h = 56
    gap = 24
    margin = 32
    cols, rows = 2, len(VARIANTS)
    sheet_w = margin * 2 + cols * cell_w + (cols - 1) * gap
    sheet_h = margin * 2 + rows * (cell_h + label_h) + (rows - 1) * gap
    sheet = Image.new("RGB", (sheet_w, sheet_h), (245, 245, 247))
    draw = ImageDraw.Draw(sheet)
    try:
        font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 22)
        font_s = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 16)
    except OSError:
        font = font_s = ImageFont.load_default()

    # column headers
    draw.text((margin + cell_w // 2, margin + 4), "LIGHT  #FFFFFF", fill=BLUE, font=font, anchor="ma")
    draw.text((margin + gap + cell_w * 2 - cell_w // 2, margin + 4), "DARK  #1E2761", fill=BLUE, font=font, anchor="ma")
    y0 = margin + 40

    for r, (fname, title, desc) in enumerate(VARIANTS):
        svg_text = (base / fname).read_text()
        row_y = y0 + r * (cell_h + label_h + gap)
        for c, (fg, bg) in enumerate([(BLUE, WHITE), (WHITE, BLUE)]):
            x = margin + c * (cell_w + gap)
            cell = render(svg_text, fg, bg, cell_w)
            sheet.paste(cell, (x, row_y))
            # frame
            draw.rectangle([x - 1, row_y - 1, x + cell_w, row_y + cell_h], outline=(210, 210, 215), width=1)
        label_x = margin + 4
        draw.text((label_x, row_y + 8), title, fill=BLUE, font=font)
        draw.text((label_x, row_y + 34), desc, fill=(90, 95, 115), font=font_s)

    out = base / "logo-variants-contact-sheet.png"
    sheet.save(out)
    print(out)

if __name__ == "__main__":
    main()
