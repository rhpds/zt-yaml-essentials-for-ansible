#!/bin/bash
# Module 2 Solve - Adds tasks section with first task if missing

WORKSPACE="/home/rhel/yaml-practice"
LAB_USER="rhel"

echo "Checking Module 2 completion..."

# Check if tasks section exists in webserver.yml
if grep -q "tasks:" "${WORKSPACE}/webserver.yml" 2>/dev/null; then
  echo "✓ Tasks section already exists"
  echo "Module 2 complete!"
else
  echo "Adding tasks section with first task..."
  cat > "${WORKSPACE}/webserver.yml" <<'EOF'
---
- name: Configure web server
  hosts: localhost
  become: true

  tasks:
    - name: Install web server package
      ansible.builtin.package:
        name: httpd
EOF
  chown "${LAB_USER}:${LAB_USER}" "${WORKSPACE}/webserver.yml"
  echo "✓ Added tasks section with Install web server task"
fi
