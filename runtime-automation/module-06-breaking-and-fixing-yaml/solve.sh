#!/bin/bash
# Module 6 Solve - Fixes all four broken YAML files

WORKSPACE="/home/rhel/yaml-practice"
LAB_USER="rhel"

echo "Fixing all broken YAML files..."

# Fix webserver-broken-A.yml (indentation error)
cat > "${WORKSPACE}/webserver-broken-A.yml" <<'EOF'
---
- name: Configure web server
  hosts: localhost

  tasks:
    - name: Install web server package  # Fixed indentation
      ansible.builtin.package:
        name: httpd
EOF

# Fix webserver-broken-B.yml (missing quotes)
cat > "${WORKSPACE}/webserver-broken-B.yml" <<'EOF'
---
- name: Configure web server
  hosts: localhost

  tasks:
    - name: Create custom home page
      ansible.builtin.copy:
        dest: /var/www/html/index.html
        content: "Welcome!"
        mode: '0644'  # Fixed - added quotes
EOF

# Fix webserver-broken-C.yml (missing list dash)
cat > "${WORKSPACE}/webserver-broken-C.yml" <<'EOF'
---
- name: Configure web server
  hosts: localhost

  tasks:
    - name: Install web server package
      ansible.builtin.package:
        name: httpd

    - name: Start web server  # Fixed - added dash
      ansible.builtin.service:
        name: httpd
        state: started
EOF

# Fix webserver-broken-D.yml (tab character)
cat > "${WORKSPACE}/webserver-broken-D.yml" <<'EOF'
---
- name: Configure web server
  hosts: localhost

  tasks:
    - name: Install web server  # Fixed - spaces instead of tab
      ansible.builtin.package:
        name: httpd
EOF

chown "${LAB_USER}:${LAB_USER}" "${WORKSPACE}"/webserver-broken-*.yml

echo "✓ Fixed all 4 broken YAML files:"
echo "  - webserver-broken-A.yml (indentation)"
echo "  - webserver-broken-B.yml (quotes)"
echo "  - webserver-broken-C.yml (list dash)"
echo "  - webserver-broken-D.yml (tab character)"
echo "Module 6 complete!"
