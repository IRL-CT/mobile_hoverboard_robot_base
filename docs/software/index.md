# Software Overview

The Mobile Hoverboard Robot Base runs **ROS 2 Humble** on **Ubuntu 22.04** across two Raspberry Pis.

---

## Two-RPi Architecture

| RPi | Location | Role |
|-----|----------|------|
| **Base RPi** | Inside the robot | Runs ODrive motor controller (`mobile_robot_control`) |
| **Controller RPi** | External, carried by operator | Runs joystick node and key mapping (`joy_teleop_keymapping`) |

The two RPis communicate over ROS 2 on a shared WiFi network. The operator uses the 8BitDo controller → controller RPi → `/cmd_vel` topic → base RPi → ODrive → motors.

---

## Software Stack

| Component | Package |
|-----------|---------|
| OS | Ubuntu 22.04 LTS |
| Middleware | ROS 2 Humble |
| Joystick input | `ros-humble-joy` |
| Button mapping | [`joy_teleop_keymapping`](https://github.com/IRL-CT/mobilehri2023) |
| Motor control | [`mobile_robot_control`](https://github.com/IRL-CT/mobilehri2023) |
| Motor driver | ODrive v3.6 via `odrivetool` / USB |

---

## Getting Started

Follow these guides in order:

1. [**Installation**](installation.md) — Ubuntu + ROS 2 + workspace setup
2. [**Calibration**](configuration.md) — ODrive motor calibration
3. [**Running the Robot**](running.md) — Full startup sequence

---

## Source Repository

```
https://github.com/FAR-Lab/mobilehri2023
```
