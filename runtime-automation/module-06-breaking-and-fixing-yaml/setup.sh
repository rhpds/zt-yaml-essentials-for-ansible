#!/bin/bash
# Module 6 Setup - Creates four intentionally broken YAML files for debugging practice

WORKSPACE="/home/rhel/yaml-practice"
LAB_USER="rhel"

echo "Creating broken YAML files for Module 6..."

# Broken file A: Indentation error
cat > "${WORKSPACE}/webserver-broken-A.yml" <<'EOF'
---
- name: Configure web server
  hosts: localhost

  tasks:
      - name: Install web server package  # Indented too far
      ansible.builtin.package:
        name: httpd
EOF

# Broken file B: Missing quotes
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

# Broken file C: Missing list dash
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

# Broken file D: Tab character instead of spaces
# Using printf to insert literal tab character
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

# Set ownership
chown "${LAB_USER}:${LAB_USER}" "${WORKSPACE}"/webserver-broken-*.yml

echo "Created 4 broken YAML files for debugging practice"
