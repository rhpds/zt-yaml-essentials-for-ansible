#!/bin/bash
# Module 1 Setup - Creates initial webserver.yml file
# This file is already created by setup-host1.sh during lab provisioning,
# so this script just ensures it exists

WORKSPACE="/home/rhel/yaml-practice"
LAB_USER="rhel"

# Ensure workspace exists
mkdir -p "${WORKSPACE}"

# Create webserver.yml if it doesn't exist
if [ ! -f "${WORKSPACE}/webserver.yml" ]; then
  cat > "${WORKSPACE}/webserver.yml" <<'EOF'
---
- name: Configure web server
  hosts: localhost
  become: true
EOF
  chown "${LAB_USER}:${LAB_USER}" "${WORKSPACE}/webserver.yml"
fi
