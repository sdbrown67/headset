# Quest 3 A-Frame GLB Viewer

A simple WebXR viewer built with A-Frame for displaying `.glb` models in VR/MR on the Meta Quest 3.

The model appears approximately **1 meter in front of the camera at head height**, making it easy to inspect immediately after entering immersive mode.

## Features

- View `.glb` models in browser on Meta Quest 3
- A-Frame + WebXR
- Model positioned at head height
- Works in VR mode
- Simple static hosting

## Project Structure

```bash
.
├── index.html
├── model.glb
└── README.md
```

## Setup

### 1. Clone repository

```bash
git clone https://github.com/yourusername/quest3-glb-viewer.git
cd quest3-glb-viewer
```

### 2. Add your GLB model

Replace or add your model as:

```bash
model.glb
```

If your file has another name, update `index.html`:

```html
gltf-model="url(your-model-name.glb)"
```

## Run Locally

Because browsers restrict local file loading, use a local server.

Python:

```bash
python -m http.server 8000
```

Then open:

```bash
http://localhost:8000
```

## Deploy

This project works best when hosted over HTTPS.

Recommended hosting:
- GitHub Pages
- Netlify
- Vercel

### GitHub Pages

1. Push project to GitHub
2. Go to:

```text
Settings → Pages
```

3. Select:
   - Branch: `main`
   - Folder: `/root`

Your site will be published at:

```text
https://yourusername.github.io/quest3-glb-viewer/
```

## Viewing on Meta Quest 3

1. Open **Browser** on Quest 3
2. Navigate to your deployed URL
3. Wait for page load
4. Select **Enter VR**

The model should appear:
- centered horizontally
- at head height
- ~1 meter in front of you

## Default Positioning

The viewer uses:

```html
<a-camera position="0 1.6 0"></a-camera>
<a-entity
  gltf-model="url(model.glb)"
  position="0 0 -1">
</a-entity>
```

Meaning:
- camera eye height ≈ 1.6m
- model at same height
- 1 meter forward

## Troubleshooting

### Model not visible

Try scaling:

```html
scale="0.1 0.1 0.1"
```

or

```html
scale="10 10 10"
```

### Black model

Some models need lights:

```html
<a-light type="ambient" intensity="1"></a-light>
<a-light type="directional" position="1 1 1"></a-light>
```

### Model too close/far

Adjust:

```html
position="0 0 -1"
```

Examples:

```html
position="0 0 -2"
position="0 -0.2 -1"
```

## Tech Stack

- A-Frame
- WebXR
- GLTF / GLB
- Meta Quest Browser

## License

MIT