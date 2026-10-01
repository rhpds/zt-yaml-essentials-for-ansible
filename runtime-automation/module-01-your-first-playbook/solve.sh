#!/bin/bash
# Module 1 Solve - Ensures webserver.yml exists with minimal playbook

WORKSPACE="/home/rhel/yaml-practice"
LAB_USER="rhel"

echo "Checking Module 1 completion..."

# Module 1 just needs the basic play structure to exist
if [ -f "${WORKSPACE}/webserver.yml" ]; then
  echo "✓ webserver.yml exists"
  echo "Module 1 complete - you have a basic playbook!"
else
  echo "Creating webserver.yml..."
  cat > "${WORKSPACE}/webserver.yml" <<'EOF'
---
- name: Configure web server
  hosts: localhost
  become: true
EOF
  chown "${LAB_USER}:${LAB_USER}" "${WORKSPACE}/webserver.yml"
  echo "✓ Created webserver.yml"
fi
