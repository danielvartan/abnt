# abnt

Snapshot settings.

## General Settings

- Theme: Light
- Screen resolution: 1920x1080

- **Turn off Night Light mode**!
- Resize the window (see *Window Size* settings)
- Full screen
- Double page view

## GIF Settings

1. Clear all files from the *Screenshots* folder
2. Capture screenshots starting from the last page
3. Ensure no notification pop-ups are visible when taking screenshots

### Render

1. Install `ImageMagick` (if not already installed).
2. Run:

```bash
magick -delay 60 -loop 0 *.png output.gif
```
