Glances Web UI Installer for Proxmox and Debian. This project provides a clean,
repeatable installer for running the Glances monitoring dashboard with a full web
interface on Proxmox or any Debian-based system. It installs Glances in a Python virtual
environment, enables full hardware sensor support including CPU temperatures, NVMe
temperatures, fan speeds, and voltage readings, runs Glances as a systemd service,
starts it automatically on boot, and provides access to the dashboard at
http://NODE_IP:61208. Installation requires cloning the repository from
https://github.com/RyanKimTech/glances.git, entering the project
directory, making the installer executable, and running it with sudo. The dashboard is
accessed through the same URL. Uninstallation requires making the uninstaller executable
and running it with sudo. The project is licensed under MIT.
