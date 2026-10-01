#!/bin/bash
# Module 5 Solve - Adds comments to playbook if missing

WORKSPACE="/home/rhel/yaml-practice"
LAB_USER="rhel"

echo "Checking Module 5 completion..."

# Check if comments exist (look for "# Package installation" as indicator)
if grep -q "# Package installation" "${WORKSPACE}/webserver.yml" 2>/dev/null; then
  echo "✓ Comments already added"
  echo "Module 5 complete!"
else
  echo "Adding comments to playbook..."
  cat > "${WORKSPACE}/webserver.yml" <<'EOF'
# This playbook configures a basic Apache web server on localhost
# Tested on RHEL 9

---
- name: Configure web server
  hosts: localhost

  tasks:
    # Package installation
    - name: Install web server package
      ansible.builtin.package:
        name: httpd

    # Service management
    - name: Start web server
      ansible.builtin.service:
        name: httpd
        state: started

    - name: Enable web server on boot
      ansible.builtin.service:
        name: httpd
        enabled: yes

    # Content deployment
    - name: Create custom home page
      ansible.builtin.copy:
        dest: /var/www/html/index.html
        content: "Welcome to my web server!"
        owner: apache
        mode: '0644'  # Quoted to prevent YAML from interpreting as octal
EOF
  chown "${LAB_USER}:${LAB_USER}" "${WORKSPACE}/webserver.yml"
  echo "✓ Added header and section comments"
fi
