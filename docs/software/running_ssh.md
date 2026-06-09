# Running the Robot - *SSH only*

This page covers the full connection sequence for wirelessly controlling the hoverboard base. Two Raspberry Pis must be running simultaneously — one inside the robot (base) and one external (controller).

## Step 1: Raspberry Pi and Router Set-Up

- [ ] Power on both Raspberry Pis.

    - On-board RPi connects to on-board power bank.
    - Off-board RPi connects to external power source (ex. off-board power bank).

- [ ] Power on NetGear router. Connect laptop to `NT_GEAR` WiFi. (Check router for password.)
    - Computer will prompt to open new window with WiFi connection details. 

    - Check that **3 devices** are connected: **2 Raspberry Pis** and **host device**.

---
## Step 2: SSH into Raspberry Pi's

Running the robot requires **2 terminals** across the two Raspberry Pis.

- [ ] Create two terminals and SSH into each RPi:

| Terminal | RPi | Command |
|----------|-----|---------|
| 1 | Base RPi | `ssh ubuntu@<off-board-rpi-ip>` |
| 2 | Controller RPi | `ssh ubuntu@<on-board-rpi-ip>` |

---

## Step 2: Calibrate the ODrive

- [ ] In **Terminal 1**, connect to the **base (on-board) RPi**:

```bash
odrivetool
```

- Check that ODrive connects. Connection issues are often due to faulty cords.
- [ ] Run this to ensure no errors:

```bash
dump_errors(odrv0)
odrv0.clear_errors()
```

- [ ] Calibrate the ODrive:

```bash
odrv0.axis0.requested_state = AXIS_STATE_FULL_CALIBRATION_SEQUENCE
odrv0.axis1.requested_state = AXIS_STATE_FULL_CALIBRATION_SEQUENCE
```

- [ ] Run `dump_errors(odrv0)` **multiple times while calibrating** to check if there are new errors. 
    - If errors arise, address the error message, run `odrv0.clear_errors()`, and continue. Retry calibration if errors persist.
- [ ] Once calibration completes (base stops moving), quit `odrivetool`. Configure the base for controller connection.

```bash
quit()
./start_mobile_base.sh
```

!!! warning "Unplug Before Reconnecting"
    If you `Ctrl + C` in Terminals 1 or 2 after a successful base-controller connection or during Step 2, the base cannot properly reconnect due to unfinished port clean up.

    **When reconnecting after quitting, unplug and reconnect base RPi from on-board bank and battery from ODrive**.

    The same terminals can be used once the RPi and battery are replugged!

---

## Step 3: Connect to Controller

- [ ] Check that the off-board RPi is connected to a charged controller. 
- [ ] In **Terminal 2**, connect to the **controller (off-board) RPi**:

```bash
./start_controller.sh
```

---
## Step 4: Drive!

Use the [8BitDo Lite 2 controller](../teleoperation.md) to drive the robot. Place the attachment (trash bin, chair, etc.) on top before operating in public.

!!! tip "Controller Key Mapping"
    Different controllers may have different key mappings. You can always print /joy topic messages to inspect if the code aligns with the mapping.

    Safety button. In our code, you **must hold down the top left (L1 / L2) trigger** on the controller for the robot to start listening to the joysticks. This is good to have as a safety feature.
    
---

## Shutdown
- [ ] `Ctrl + C` in both terminals to exit.
- [ ] Disconnect both RPi's. Unplug the hoverboard battery.
