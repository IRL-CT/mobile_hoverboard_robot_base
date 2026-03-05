# Running the Robot

This page covers the full startup sequence for operating the platform. Two Raspberry Pis must be running simultaneously — one inside the robot (base) and one external (controller).

---

## Terminal Overview

Running the robot requires **5 terminals** across the two Raspberry Pis:

| Terminal | RPi | Command |
|----------|-----|---------|
| 1 | Controller RPi | `ros2 run joy joy_node` |
| 2 | Controller RPi | `ros2 topic echo /joy` (debug) |
| 3 | Controller RPi | `ros2 launch joy_teleop_keymapping mapping_launch.py` |
| 4 | Controller RPi | `ros2 topic echo /cmd_vel` (debug) |
| 5 | Base RPi | `ros2 launch mobile_robot_control mobile_robot_launch.py` |

---

## Step 1: Calibrate the ODrive

Before launching, complete [ODrive calibration](configuration.md) on the base RPi.

---

## Step 2: SSH into Both Raspberry Pis

**Base RPi (internal — runs motor controller):**
```bash
ssh ubuntu@<base-rpi-ip>
```

**Controller RPi (external — runs joystick):**
```bash
ssh ubuntu@<controller-rpi-ip>
```

Replace the IP addresses with those assigned to your Raspberry Pis on your network.

---

## Step 3: Launch on the Controller RPi

**Terminal 1** — Start the joy node (reads joystick input):
```bash
source /opt/ros/humble/setup.bash
ros2 run joy joy_node
```

**Terminal 3** — Launch the key mapping node (maps joystick to `/cmd_vel`):
```bash
cd ~/mobilehri_ws
colcon build
source install/setup.bash
ros2 launch joy_teleop_keymapping mapping_launch.py
```

---

## Step 4: Launch on the Base RPi

**Terminal 5** — Launch the mobile base controller (reads `/cmd_vel`, drives motors):
```bash
cd ~/mobilehri_ws
colcon build
source install/setup.bash
ros2 launch mobile_robot_control mobile_robot_launch.py
```

---

## Step 5: Verify

**Terminal 2** (controller RPi) — confirm joystick data is flowing:
```bash
source /opt/ros/humble/setup.bash
ros2 topic echo /joy
```

**Terminal 4** (controller RPi) — confirm velocity commands are being generated:
```bash
ros2 topic echo /cmd_vel
```

---

## Step 6: Drive!

Use the [8BitDo Lite 2 controller](../teleoperation.md) to drive the robot. Place the attachment (trash bin, chair, etc.) on top before operating in public.

---

## Quick Start Scripts

Both robots have convenience scripts that wrap the above:

```bash
# On the base RPi (after calibration):
./start_mobile_base.sh

# On the controller RPi (after base is running):
./start_controller.sh
```

---

## Shutdown

Always shut down the Raspberry Pis gracefully before cutting power:

```bash
sudo shutdown now
```

Then disconnect the hoverboard battery.
