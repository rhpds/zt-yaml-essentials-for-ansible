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
WORKSPACE="${LAB_HOME}/yaml-practice"
CODE_SERVER_VERSION="4.96.2"
CODE_SERVER_ARCH="amd64"

echo "=== Starting YAML Essentials Lab Setup on host1 ==="

# Create clean workspace directory for practice files
echo "Creating workspace directory..."
install -d -o "${LAB_USER}" -g "${LAB_USER}" -m 0755 "${WORKSPACE}"

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

# Create practice YAML files for specific exercises
echo "Creating practice YAML files..."

# Module 1: Initial webserver.yml playbook (minimal starting point)
cat > "${WORKSPACE}/webserver.yml" <<'EOF'
---
- name: Configure web server
  hosts: localhost
EOF

cat > "${WORKSPACE}/broken.yml" <<'EOF'
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

cat > "${WORKSPACE}/apache-playbook.yml" <<'EOF'
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

cat > "${WORKSPACE}/inventory" <<'EOF'
[local]
localhost ansible_connection=local
EOF

# Module 6: Broken YAML files for debugging practice
cat > "${WORKSPACE}/webserver-broken-A.yml" <<'EOF'
---
- name: Configure web server
  hosts: localhost

  tasks:
      - name: Install web server package  # Indented too far
      ansible.builtin.package:
        name: httpd
EOF

cat > "${WORKSPACE}/webserver-broken-B.yml" <<'EOF'
---
- name: Configure web server
  hosts: localhost

  tasks:
    - name: Create custom home page
      ansible.builtin.copy:
        dest: /var/www/html/index.html
        content: "Welcome!"
        mode: 0644  # Should be '0644'
EOF

cat > "${WORKSPACE}/webserver-broken-C.yml" <<'EOF'
---
- name: Configure web server
  hosts: localhost

  tasks:
    - name: Install web server package
      ansible.builtin.package:
        name: httpd

    name: Start web server  # Missing dash
    ansible.builtin.service:
      name: httpd
      state: started
EOF

# Module 6: webserver-broken-D.yml with tab character (using printf to insert literal tab)
printf '%s\n' \
  '---' \
  '- name: Configure web server' \
  '  hosts: localhost' \
  '' \
  '  tasks:' \
  $'\t- name: Install web server  # Tab character instead of spaces' \
  '      ansible.builtin.package:' \
  '        name: httpd' \
  > "${WORKSPACE}/webserver-broken-D.yml"

# Module 8: Complete annotated playbook with structure visualization
cat > "${WORKSPACE}/webserver-annotated.yml" <<'EOF'
# ┌─── YAML document starts
# │
---
# │
# ├─── Play (list item, note the dash)
# │
- name: Configure web server          # ← Level 0: Play metadata
  hosts: localhost                    # ← Level 0: Play metadata

  # ├─── Variables dictionary
  vars:                               # ← Level 1: Play key
    web_package: httpd                # ← Level 2: Variable key-value
    web_service: httpd                # ← Level 2: Variable key-value
    web_port: 80                      # ← Level 2: Variable key-value
    start_on_boot: yes                # ← Level 2: Variable key-value
    index_content: "Welcome to my web server!"  # ← Level 2: Variable key-value

  # ├─── Tasks list
  tasks:                              # ← Level 1: Play key
    # │
    # ├─── Task 1 (list item)
    - name: Install web server        # ← Level 2: Task metadata
      ansible.builtin.package:        # ← Level 2: Module name
        name: "{{ web_package }}"     # ← Level 3: Module parameter
    # │
    # ├─── Task 2 (list item)
    - name: Start web server          # ← Level 2: Task metadata
      ansible.builtin.service:        # ← Level 2: Module name
        name: "{{ web_service }}"     # ← Level 3: Module parameter
        state: started                # ← Level 3: Module parameter
    # │
    # ├─── Task 3 (list item)
    - name: Enable web server on boot # ← Level 2: Task metadata
      ansible.builtin.service:        # ← Level 2: Module name
        name: "{{ web_service }}"     # ← Level 3: Module parameter
        enabled: "{{ start_on_boot }}" # ← Level 3: Module parameter
    # │
    # └─── Task 4 (list item)
    - name: Create custom home page   # ← Level 2: Task metadata
      ansible.builtin.copy:           # ← Level 2: Module name
        dest: /var/www/html/index.html  # ← Level 3: Module parameter
        content: "{{ index_content }}" # ← Level 3: Module parameter
        owner: apache                 # ← Level 3: Module parameter
        mode: '0644'                  # ← Level 3: Module parameter
EOF

# Module 9: Database playbook template with scaffolding
cat > "${WORKSPACE}/database.yml" <<'EOF'
# Your challenge: Configure a PostgreSQL database server
# Requirements:
#   1. Use variables for package name, service name, and port
#   2. Create 3-4 tasks (your choice from the list below)
#   3. Include comments explaining each section
#   4. Use proper YAML structure (indentation, lists, dictionaries)
#
# Suggested tasks (choose 3-4):
#   - Install postgresql package
#   - Install postgresql-server package
#   - Initialize the database (command: postgresql-setup --initdb)
#   - Start the postgresql service
#   - Enable postgresql service on boot
#   - Configure firewall to allow port 5432
#   - Create a custom configuration file
#
# Start your playbook below:

---
# Your YAML starts here
EOF

# Create solutions directory and solution file (hidden reference)
install -d -o "${LAB_USER}" -g "${LAB_USER}" -m 0755 "${LAB_HOME}/solutions"
cat > "${LAB_HOME}/solutions/database-solution.yml" <<'EOF'
# PostgreSQL Database Server Configuration
# Configures a basic PostgreSQL installation on RHEL 9

---
- name: Configure PostgreSQL database server
  hosts: localhost

  vars:
    db_package: postgresql
    db_service: postgresql
    db_port: 5432
    enable_on_boot: yes

  tasks:
    # Package installation
    - name: Install PostgreSQL package
      ansible.builtin.package:
        name: "{{ db_package }}"

    - name: Install PostgreSQL server package
      ansible.builtin.package:
        name: postgresql-server

    # Database initialization
    - name: Initialize PostgreSQL database
      ansible.builtin.command:
        cmd: postgresql-setup --initdb
        creates: /var/lib/pgsql/data/PG_VERSION

    # Service management
    - name: Start PostgreSQL service
      ansible.builtin.service:
        name: "{{ db_service }}"
        state: started

    - name: Enable PostgreSQL on boot
      ansible.builtin.service:
        name: "{{ db_service }}"
        enabled: "{{ enable_on_boot }}"
EOF

# Set ownership on all created files
chown -R "${LAB_USER}:${LAB_USER}" "${WORKSPACE}"
chown -R "${LAB_USER}:${LAB_USER}" "${LAB_HOME}/solutions"

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
auth: none
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
ExecStart=/usr/bin/code-server ${WORKSPACE}
Restart=always
User=${LAB_USER}
WorkingDirectory=${WORKSPACE}

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
echo "- code-server running with NO authentication (auth: none)"
echo "- code-server accessible at http://localhost:8080"
echo "- Terminal available via /tty1"
echo ""
echo "Practice files created in ${WORKSPACE}:"
echo "  - webserver.yml (Module 1 starting point)"
echo "  - webserver-broken-*.yml (Module 6 debugging practice)"
echo "  - webserver-annotated.yml (Module 8 structure visualization)"
echo "  - database.yml (Module 9 challenge template)"
echo "  - apache-playbook.yml (existing example)"
echo "  - broken.yml (existing example)"
echo ""
echo "Solution files in ${LAB_HOME}/solutions/ (for reference after completion)"
echo ""
echo "- Logs saved to /var/log/setup-host1.log"
echo "=========================================="
