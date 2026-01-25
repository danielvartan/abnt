# abnt

Animation settings.

## System Dependencies

1. `ImageMagick`
2. `pdfnup`
  - On Arch Linux, use `yay -S pdfjam-extras` to install it.

### Render

1. Open a terminal in the directory containing the PDF file
2. Merge the pages by running:

```bash
pdfnup --landscape --frame true --outfile output.pdf index.pdf
```

3. Extract the pages as PNG files by running:

````bash
magick convert -density 300 -trim -background white -alpha remove output.pdf page-%03d.png
````

4. Create the animated GIF by running:

```bash
magick -delay 120 -loop 0 *.png animation.gif
```

5. Clean up the intermediate files by running:

```bash
rm output.pdf *.png
```
