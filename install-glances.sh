#!/bin/bash
set -e

echo "=== Installing dependencies ==="
apt update
apt install -y python3 python3-venv lm-sensors

echo "=== Creating Glances virtual environment ==="
mkdir -p /opt/glances
python3 -m venv /opt/glances

echo "=== Installing Glances with Web UI ==="
/opt/glances/bin/pip install --upgrade pip
/opt/glances/bin/pip install --no-cache-dir glances[web]

echo "=== Creating systemd service ==="
cat <<EOF >/etc/systemd/system/glances.service
[Unit]
Description=Glances Web UI
After=network.target

[Service]
Type=simple
ExecStart=/opt/glances/bin/glances -w
Restart=always
User=root
WorkingDirectory=/opt/glances

[Install]
WantedBy=multi-user.target
EOF

echo "=== Enabling and starting Glances service ==="
systemctl daemon-reload
systemctl enable glances
systemctl start glances

echo "=== Running sensors-detect (auto mode) ==="
sensors-detect --auto || true

echo "=== Installation complete ==="
echo "Glances Web UI available at: http://$(hostname -I | awk '{print $1}'):61208"
