# Drive System

The Trashbot uses the motors and wheels from a **deconstructed hoverboard**, controlled by an **ODrive v3.6** motor controller. The hoverboard provides two brushless DC hub motors with built-in hall sensors.

---

## How It Works

The platform uses **differential drive** kinematics. The two hoverboard wheel motors are driven independently — varying their relative speeds produces turning.

<figure markdown>
  ![Differential drive diagram](https://raw.githubusercontent.com/IRL-CT/Summer25_Trashbot/main/images/diff_drive.jpg){ width="500" }
  <figcaption>Differential drive kinematics</figcaption>
</figure>

The kinematic equations used in the software:

$$v_l = \frac{v - \frac{l \cdot \omega}{2}}{r}$$

$$v_r = \frac{v + \frac{l \cdot \omega}{2}}{r}$$

Where:

- $v$ = commanded linear velocity (m/s)
- $\omega$ = commanded angular velocity (rad/s)
- $l$ = wheel separation (m)
- $r$ = wheel radius (m)
- $v_l, v_r$ = left and right wheel velocities (turns/s sent to ODrive)

---

## ODrive Motor Controller

The **ODrive v3.6** is a high-performance open-source motor controller. It connects to the Raspberry Pi via USB and accepts velocity commands in turns/second.

- Product page: [ODrive v3.6](https://odriverobotics.com/shop/odrive-v36)
- ODrive hoverboard guide: [docs.odriverobotics.com](https://docs.odriverobotics.com/v/0.5.5/hoverboard.html)

See [Calibration](../software/configuration.md) for ODrive setup and tuning.

!!! note "Hoverboard-specific tuning"
    ODrive parameters (current limits, velocity limits, pole pairs) vary by hoverboard model. The config file in the repo is tuned for the specific boards in the lab. If you use a different hoverboard, you may need to adjust these values.
