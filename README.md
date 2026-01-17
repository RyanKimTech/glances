1. Overview
This project provides a clean, repeatable installer for running the Glances monitoring
dashboard with a full web UI on Proxmox or any Debian-based system. It includes an
isolated Python virtual environment, a systemd service, hardware sensor support, a
reversible uninstaller, a GitHub-ready README, and a release ZIP for distribution.
2. Features
The installer sets up Glances in the /opt/glances directory using a Python virtual
environment, enables hardware sensors including CPU temperatures, NVMe temperatures, fan
speeds, and voltage readings, runs Glances as a persistent systemd service, starts it
automatically on boot, provides a web interface accessible at http://NODE_IP:61208,
includes a clean uninstaller that removes all Glances components, and preserves
sensors-detect changes as requested in Option 3B.
