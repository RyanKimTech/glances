#!/bin/bash
set -e

echo "=== Stopping Glances service ==="
systemctl stop glances 2>/dev/null || true

echo "=== Disabling Glances service ==="
systemctl disable glances 2>/dev/null || true

echo "=== Removing systemd service file ==="
rm -f /etc/systemd/system/glances.service

echo "=== Removing Glances virtual environment ==="
rm -rf /opt/glances

echo "=== Reloading systemd ==="
systemctl daemon-reload

echo "=== Cleaning up logs and cache ==="
rm -rf /var/log/glances 2>/dev/null || true
rm -rf /root/.config/glances 2>/dev/null || true
rm -rf /root/.cache/pip 2>/dev/null || true

echo "=== Uninstall complete ==="
echo "Sensors-detect changes were preserved as requested."
