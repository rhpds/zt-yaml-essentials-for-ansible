#!/bin/bash
# Module 9 Solve - Creates complete database.yml solution

WORKSPACE="/home/rhel/yaml-practice"
LAB_USER="rhel"

echo "Creating database.yml solution..."

cat > "${WORKSPACE}/database.yml" <<'EOF'
# PostgreSQL Database Server Configuration
# Configures a basic PostgreSQL installation on RHEL 9

---
- name: Configure PostgreSQL database server
  hosts: localhost
  become: true

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

chown "${LAB_USER}:${LAB_USER}" "${WORKSPACE}/database.yml"

echo "✓ Created complete database.yml playbook with:"
echo "  - vars section (4 variables)"
echo "  - 5 tasks (install, install-server, initialize, start, enable)"
echo "  - Comments for each section"
echo "Module 9 complete!"
