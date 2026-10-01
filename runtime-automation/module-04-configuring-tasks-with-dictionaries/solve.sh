#!/bin/bash
# Module 4 Solve - Adds copy task with multiple parameters if missing

WORKSPACE="/home/rhel/yaml-practice"
LAB_USER="rhel"

echo "Checking Module 4 completion..."

# Check if copy task exists
if grep -q "Create custom home page" "${WORKSPACE}/webserver.yml" 2>/dev/null; then
  echo "✓ Copy task with parameters already exists"
  echo "Module 4 complete!"
else
  echo "Adding copy task with parameters..."
  cat > "${WORKSPACE}/webserver.yml" <<'EOF'
---
- name: Configure web server
  hosts: localhost

  tasks:
    - name: Install web server package
      ansible.builtin.package:
        name: httpd

    - name: Start web server
      ansible.builtin.service:
        name: httpd
        state: started

    - name: Enable web server on boot
      ansible.builtin.service:
        name: httpd
        enabled: yes

    - name: Create custom home page
      ansible.builtin.copy:
        dest: /var/www/html/index.html
        content: "Welcome to my web server!"
        owner: apache
        mode: '0644'
EOF
  chown "${LAB_USER}:${LAB_USER}" "${WORKSPACE}/webserver.yml"
  echo "✓ Added copy task with dest, content, owner, mode parameters"
fi
