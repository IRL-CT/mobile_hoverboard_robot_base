# Mobile Hoverboard Robot Base — Documentation

Documentation site for the CT-IRL Mobile Hoverboard Robot Base, built with [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).

Live site: https://irl-ct.github.io/mobile_hoverboard_robot_base/

---

## Preview Locally

**1. Install dependencies** (Python 3.8+ required):

```bash
pip install -r requirements.txt
```

**2. Serve the site with live reload:**

```bash
mkdocs serve
```

Open http://127.0.0.1:8000 in your browser. The site automatically refreshes when you save any file.

**3. Build the static site** (optional, outputs to `site/`):

```bash
mkdocs build
```

---

## Project Structure

```
docs/
├── index.md                  # Home page
├── bom.md                    # Bill of Materials
├── assembly/
│   ├── index.md              # Assembly overview
│   ├── frame.md              # Dolly frame setup
│   ├── electronics.md        # Electronics integration (post-calibration)
│   ├── drive.md              # Drive system
│   └── sensors.md            # Sensors
├── software/
│   ├── index.md              # Software overview
│   ├── configuration.md      # ODrive calibration (bench setup + software)
│   ├── installation.md       # ROS 2 installation
│   └── running.md            # Running the robot
├── teleoperation.md          # Bluetooth joystick control
├── research.md               # Related research and publications
└── assets/
    ├── images/               # Local images
    ├── stylesheets/extra.css # Cornell red color theme
    └── javascripts/mathjax.js
mkdocs.yml                    # Site configuration
requirements.txt              # Python dependencies
.github/workflows/deploy.yml  # Auto-deploy to GitHub Pages on push to main
```

---

## Deployment

Pushing to `main` automatically builds and deploys the site via GitHub Actions. No manual steps needed.

To trigger a deploy without a code change, go to **Actions → Deploy MkDocs to GitHub Pages → Run workflow**.
