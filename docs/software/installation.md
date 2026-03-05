# Installation

This guide walks through setting up Ubuntu 22.04 and ROS 2 Humble on the Raspberry Pi.

!!! tip "Pre-configured image"
    The lab maintains a pre-configured Raspberry Pi image with ROS 2, the workspace, and all dependencies already set up. If you have access to it, flash that image and skip to [Running the Robot](running.md).

    [Download class RPi image](https://drive.google.com/file/d/1PMWyJUoA-CJ73vktrp3nPKiykwzOaauU/view?usp=sharing) · [How to flash with RPi Imager](https://howchoo.com/pi/raspberry-pi-imager#write-a-custom-image)

---

## 1. Install Ubuntu 22.04 on Raspberry Pi

Use the [Raspberry Pi Imager](https://www.raspberrypi.com/software/) to write **Ubuntu 22.04 LTS (64-bit)** to an SD card.

- Download Ubuntu for RPi: [ubuntu.com/download/raspberry-pi](https://ubuntu.com/download/raspberry-pi)

---

## 2. Install ROS 2 Humble

Follow the [official ROS 2 Humble installation guide](https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debs.html), or use the commands below.

```bash
# Set locale
sudo apt update && sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# Add ROS 2 apt repository
sudo apt install -y software-properties-common curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
  -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
  http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" \
  | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS 2 Humble desktop
sudo apt update && sudo apt install -y ros-humble-desktop

# Install joy package for joystick support
sudo apt install -y ros-humble-joy
```

---

## 3. Source the ROS 2 Environment

You need to source ROS 2 every time you open a new terminal. To do this automatically:

```bash
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

---

## 4. Set Up the ROS 2 Workspace

```bash
mkdir -p ~/mobilehri_ws/src
cd ~/mobilehri_ws/src

# Clone the mobile HRI control packages
git clone https://github.com/FAR-Lab/mobilehri2023.git

cd ~/mobilehri_ws
colcon build
source install/setup.bash
```

Add the workspace to your `.bashrc` so it's always sourced:

```bash
echo "source ~/mobilehri_ws/install/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

---

## 5. Install ODrive Tool

The ODrive tool is used to configure and calibrate the motor controller.

Follow instructions [here](https://docs.odriverobotics.com/v/latest/interfaces/odrivetool.html).

---