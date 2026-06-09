#!/bin/bash

set -e

echo "=================================================="
echo "Initializing ODrive Calibration Sequence..."
echo "=================================================="

# Commands to odrivetool shell
odrivetool shell <<EOF
import time
from odrive.enums import *

print("\n--- Checking and clearing initial errors ---")
dump_errors(odrv0)
odrv0.clear_errors()

print("\n--- Launching full calibration on axis0 and axis1 ---")
print("The hardware will begin moving. Please stand clear.")
odrv0.axis0.requested_state = AXIS_STATE_FULL_CALIBRATION_SEQUENCE
odrv0.axis1.requested_state = AXIS_STATE_FULL_CALIBRATION_SEQUENCE

# Check errors periodically while calibrating
check_freq = 11
for i in range(check_freq):
    time.sleep(3)
    print(f"\nMonitoring calibration progress (Check {i+1}/{check_freq})…")
    dump_errors(odrv0)

print("\n--- Final Error Check ---")
dump_errors(odrv0)

print("\nExiting odrivetool...")
quit()
EOF

echo "=================================================="
echo "Calibration commands completed."
echo “If no errors, ready to start mobile base.”
echo "=================================================="