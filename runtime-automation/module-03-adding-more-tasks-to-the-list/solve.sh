#!/bin/bash
# Module 3 Solve - Adds all three tasks (install, start, enable) if missing

WORKSPACE="/home/rhel/yaml-practice"
LAB_USER="rhel"

echo "Checking Module 3 completion..."

# Check if all three tasks exist
INSTALL_EXISTS=$(grep -c "Install web server package" "${WORKSPACE}/webserver.yml" 2>/dev/null || echo 0)
START_EXISTS=$(grep -c "Start web server" "${WORKSPACE}/webserver.yml" 2>/dev/null || echo 0)
ENABLE_EXISTS=$(grep -c "Enable web server on boot" "${WORKSPACE}/webserver.yml" 2>/dev/null || echo 0)

if [ "$INSTALL_EXISTS" -gt 0 ] && [ "$START_EXISTS" -gt 0 ] && [ "$ENABLE_EXISTS" -gt 0 ]; then
  echo "✓ All three tasks already exist"
  echo "Module 3 complete!"
else
  echo "Adding all three tasks to webserver.yml..."
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
EOF
  chown "${LAB_USER}:${LAB_USER}" "${WORKSPACE}/webserver.yml"
  echo "✓ Added install, start, and enable tasks"
fi
