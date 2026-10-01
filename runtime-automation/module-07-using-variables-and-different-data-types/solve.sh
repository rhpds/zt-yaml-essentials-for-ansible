#!/bin/bash
# Module 7 Solve - Adds variables section and updates tasks to use variables

WORKSPACE="/home/rhel/yaml-practice"
LAB_USER="rhel"

echo "Checking Module 7 completion..."

# Check if vars section exists
if grep -q "vars:" "${WORKSPACE}/webserver.yml" 2>/dev/null; then
  echo "✓ Variables section already exists"
  echo "Module 7 complete!"
else
  echo "Adding variables section and updating tasks..."
  cat > "${WORKSPACE}/webserver.yml" <<'EOF'
# This playbook configures a basic Apache web server on localhost
# Tested on RHEL 9

---
- name: Configure web server
  hosts: localhost
  become: true

  vars:
    web_package: httpd
    web_service: httpd
    web_port: 80
    start_on_boot: yes
    index_content: "Welcome to my web server!"

  tasks:
    # Package installation
    - name: Install web server package
      ansible.builtin.package:
        name: "{{ web_package }}"

    # Service management
    - name: Start web server
      ansible.builtin.service:
        name: "{{ web_service }}"
        state: started

    - name: Enable web server on boot
      ansible.builtin.service:
        name: "{{ web_service }}"
        enabled: "{{ start_on_boot }}"

    # Content deployment
    - name: Create custom home page
      ansible.builtin.copy:
        dest: /var/www/html/index.html
        content: "{{ index_content }}"
        owner: apache
        mode: '0644'  # Quoted to prevent YAML from interpreting as octal
EOF
  chown "${LAB_USER}:${LAB_USER}" "${WORKSPACE}/webserver.yml"
  echo "✓ Added vars section with 5 variables of different types"
  echo "✓ Updated tasks to use variable references"
fi
