#!/bin/bash

# Avoid rerun
if [ -f /etc/bootstrap.lock ]; then
  echo "[INFO] Startup already completed"
  exit 0
fi

echo "[INFO] Starting server bootstrap and LVM configuration..."

# Update and install base packages
echo "[INFO] Updating apt cache and upgrading packages..."
sudo apt update -y && sudo apt upgrade -y

echo "[INFO] Installing essential packages..."
sudo apt install -y curl wget unzip git htop net-tools jq lsb-release software-properties-common lvm2

# Identify the persistent disk
DEVICE=$(lsblk -dpno NAME,TYPE | grep disk | grep -v sda | awk '{print $1}')
VG_NAME="vg_data"
HOSTNAME=$(hostname)
LV_NAME="lv-${HOSTNAME}"
MOUNT_PATH="/opt/${HOSTNAME}"

if [ ! -z "$DEVICE" ]; then
  echo "[INFO] Setting up LVM on $DEVICE with mount point $MOUNT_PATH..."

  # Create LVM setup
  sudo pvcreate "$DEVICE"
  sudo vgcreate "$VG_NAME" "$DEVICE"
  sudo lvcreate -l 100%FREE -n "$LV_NAME" "$VG_NAME"

  # Format and mount
  sudo mkfs.ext4 "/dev/${VG_NAME}/${LV_NAME}"
  sudo mkdir -p /opt
  echo "/dev/${VG_NAME}/${LV_NAME} /opt ext4 defaults 0 0" | sudo tee -a /etc/fstab
  sudo mount -a

  echo "[INFO] LVM volume mounted successfully at /opt"
else
  echo "[WARN] No persistent disk found (non-sda), skipping LVM setup"
fi

# Lock file to prevent rerun
touch /etc/bootstrap.lock

echo "[INFO] Bootstrap completed successfully."
