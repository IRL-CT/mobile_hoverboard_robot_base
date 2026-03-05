# Mobile Hoverboard Robot Base

The **Mobile Hoverboard Robot Base** is a low-cost, modular mobile robot base developed by the [Cornell Tech Interaction Lab (CT-IRL)](https://github.com/IRL-CT). Built from a deconstructed hoverboard, it is designed to be attached to everyday objects — like a trash bin, a cart, or furniture — to create novel robots for Human-Robot Interaction (HRI) research. Operators control it remotely using the **Wizard of Oz** method, simulating autonomous behavior.

<figure markdown>
  ![Trashbot demo](assets/images/trashbot_demo.gif){ width="600" }
  <figcaption>Platform in action — trash bin configuration</figcaption>
</figure>

---

## Chair robot Demo

<div style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;">
  <iframe
    src="https://www.youtube.com/embed/nU0mXdVdcYY"
    style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;"
    allowfullscreen>
  </iframe>
</div>

---

## Overview

The platform is built around a **deconstructed hoverboard** driven by an **ODrive motor controller**, managed by a **Raspberry Pi** running **ROS 2 Humble**. A second Raspberry Pi with an 8BitDo Lite 2 Bluetooth controller provides wireless teleoperation.

Key capabilities:

- **Differential drive** locomotion via hoverboard motors
- Mounted **Insta360** for first-person video
- Wizard of Oz operation for HRI studies

---

## Quick Links

| Section | Description |
|---|---|
| [Bill of Materials](bom.md) | Parts list with sourcing links |
| [Assembly: Frame](assembly/frame.md) | Dolly and mounting plate setup |
| [Assembly: Electronics](assembly/electronics.md) | ODrive, RPi, and wiring |
| [Software: Installation](software/installation.md) | Ubuntu + ROS 2 setup on Raspberry Pi |
| [Software: Calibration](software/configuration.md) | ODrive motor calibration |
| [Teleoperation](teleoperation.md) | Bluetooth joystick control |

---

## Two-RPi Architecture

Each robot unit uses two Raspberry Pis — one mounted inside the base (runs the motor controller) and one carried externally by the operator (runs the joystick controller). They communicate over a shared WiFi network via ROS 2.

---

## Related Repositories

- [Summer25_Trashbot](https://github.com/IRL-CT/Summer25_Trashbot)
- [Mobile_HRI_Lab_Hub](https://github.com/IRL-CT/Mobile_HRI_Lab_Hub) — course lab materials
- [mobilehri2023](https://github.com/FAR-Lab/mobilehri2023) — ROS 2 packages for joystick mapping and motor control
