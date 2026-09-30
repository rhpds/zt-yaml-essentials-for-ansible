#!/bin/bash
# Setup script for host1 (YAML Essentials lab environment)
# This script is automatically executed by ZT when host1 is provisioned

set -eu  # Exit on error and undefined variables

# Log everything to a file for debugging
exec 1> >(tee -a /var/log/setup-host1.log)
exec 2>&1

echo "=========================================="
echo "Starting setup-host1.sh at $(date)"
echo "=========================================="

LAB_USER="rhel"
LAB_HOME="/home/${LAB_USER}"
CODE_SERVER_VERSION="4.96.2"
CODE_SERVER_ARCH="amd64"
CODE_SERVER_PASSWORD="ansible123!"

echo "=== Starting YAML Essentials Lab Setup on host1 ==="

# Check if yamllint is available
echo "Checking yamllint..."
if ! command -v yamllint >/dev/null 2>&1; then
  echo "WARNING: yamllint not found, attempting to install..."
  dnf install -y yamllint || echo "Could not install yamllint - will skip"
fi

# Create yamllint config with beginner-friendly rules
echo "Creating yamllint config..."
install -d -o "${LAB_USER}" -g "${LAB_USER}" -m 0700 "${LAB_HOME}"
cat > "${LAB_HOME}/.yamllint" <<'EOF'
extends: default
rules:
  line-length:
    max: 120
  indentation:
    spaces: 2
  document-start: require
EOF
chown "${LAB_USER}:${LAB_USER}" "${LAB_HOME}/.yamllint"

# Create practice YAML files
echo "Creating practice YAML files..."
cat > "${LAB_HOME}/syntax-practice.yml" <<'EOF'
---

EOF

cat > "${LAB_HOME}/data-types-practice.yml" <<'EOF'
---

EOF

cat > "${LAB_HOME}/practice.yaml" <<'EOF'
---

EOF

cat > "${LAB_HOME}/broken.yml" <<'EOF'
name:value
description: "This file has multiple YAML syntax errors for practice"
	indented_with_tab: true
items:
    - first
  - second
trailing_spaces: "check this line"
missing_doc_start: true
this_line_is_intentionally_way_too_long_to_exceed_the_recommended_line_length_limit_of_120_characters_which_should_trigger_a_yamllint_warning
EOF

cat > "${LAB_HOME}/apache-playbook.yml" <<'EOF'
---
- name: Install and configure Apache web server
  hosts: localhost
  become: true
  tasks:
    - name: Install Apache package
      ansible.builtin.package:
        name: httpd
        state: present

    - name: Start Apache service
      ansible.builtin.service:
        name: httpd
        state: started
        enabled: true

    - name: Allow HTTP traffic through firewall
      ansible.posix.firewalld:
        service: http
        permanent: true
        state: enabled
        immediate: true
      when: ansible_os_family == "RedHat"
EOF

cat > "${LAB_HOME}/inventory" <<'EOF'
[local]
localhost ansible_connection=local
EOF

# Set ownership on all created files
chown -R "${LAB_USER}:${LAB_USER}" "${LAB_HOME}"/{syntax-practice.yml,data-types-practice.yml,practice.yaml,broken.yml,apache-playbook.yml,inventory}

# Check if code-server is available (should be pre-installed in devtools-ansible image)
echo "Checking code-server..."
if ! command -v code-server >/dev/null 2>&1; then
  echo "ERROR: code-server not found, but devtools-ansible image should have it pre-installed!"
  echo "Attempting manual installation as fallback..."

  CODE_SERVER_RPM="/var/tmp/code-server-${CODE_SERVER_VERSION}-${CODE_SERVER_ARCH}.rpm"
  CODE_SERVER_URL="https://github.com/coder/code-server/releases/download/v${CODE_SERVER_VERSION}/code-server-${CODE_SERVER_VERSION}-${CODE_SERVER_ARCH}.rpm"

  if curl --fail --location --retry 3 --output "${CODE_SERVER_RPM}" "${CODE_SERVER_URL}"; then
    rpm -Uvh "${CODE_SERVER_RPM}" || echo "RPM install failed"
    rm -f "${CODE_SERVER_RPM}"
  else
    echo "FATAL: Could not download or install code-server"
    exit 1
  fi
else
  echo "code-server found at $(which code-server)"
fi

# Configure code-server
echo "Configuring code-server..."
install -d -o "${LAB_USER}" -g "${LAB_USER}" -m 0700 "${LAB_HOME}/.config/code-server"
cat > "${LAB_HOME}/.config/code-server/config.yaml" <<EOF
bind-addr: 0.0.0.0:8080
auth: password
password: ${CODE_SERVER_PASSWORD}
cert: false
EOF
chown "${LAB_USER}:${LAB_USER}" "${LAB_HOME}/.config/code-server/config.yaml"

# Configure VS Code settings
echo "Configuring VS Code settings..."
VSCODE_USER_DIR="${LAB_HOME}/.local/share/code-server/User"
install -d -o "${LAB_USER}" -g "${LAB_USER}" -m 0700 "${VSCODE_USER_DIR}"
cat > "${VSCODE_USER_DIR}/settings.json" <<'EOF'
{
  "security.workspace.trust.enabled": false
}
EOF
chown "${LAB_USER}:${LAB_USER}" "${VSCODE_USER_DIR}/settings.json"

# Create code-server systemd service
echo "Creating code-server systemd service..."
cat > /etc/systemd/system/code-server.service <<EOF
[Unit]
Description=code-server
After=network.target

[Service]
Type=exec
ExecStart=/usr/bin/code-server
Restart=always
User=${LAB_USER}
WorkingDirectory=${LAB_HOME}

[Install]
WantedBy=multi-user.target
EOF

# Keep the user service alive after provisioning
echo "Enabling user linger..."
loginctl enable-linger ${LAB_USER} || true

# Start code-server
echo "Starting code-server..."
systemctl daemon-reload
systemctl enable --now code-server
systemctl restart code-server

# Wait for code-server to be ready
echo "Waiting for code-server to start..."
timeout 60 bash -c 'until curl -s http://localhost:8080 >/dev/null; do sleep 1; done' || {
  echo "ERROR: code-server did not start within 60 seconds"
  systemctl status code-server
  exit 1
}

echo "=========================================="
echo "Verifying setup..."
echo "=========================================="
systemctl --no-pager --full status code-server || true
echo ""
echo "Port 8080 status:"
ss -tlnp | grep 8080 || echo "WARNING: Port 8080 not listening!"
echo ""
echo "=========================================="
echo "Setup Complete at $(date)"
echo "=========================================="
echo "- yamllint: $(which yamllint || echo 'NOT FOUND')"
echo "- code-server: $(which code-server || echo 'NOT FOUND')"
echo "- Practice YAML files created in ${LAB_HOME}"
echo "- code-server password: ${CODE_SERVER_PASSWORD}"
echo "- code-server should be on http://localhost:8080"
echo "- Terminal available via /tty1"
echo "- Logs saved to /var/log/setup-host1.log"
echo "=========================================="
