#!/bin/bash
# Module 9 Setup - Creates database.yml template and solution file

WORKSPACE="/home/rhel/yaml-practice"
SOLUTIONS_DIR="/home/rhel/solutions"
LAB_USER="rhel"

echo "Creating database challenge files for Module 9..."

# Create database.yml template with scaffolding
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

# Create solutions directory if it doesn't exist
mkdir -p "${SOLUTIONS_DIR}"

# Create solution file (for reference after completion)
cat > "${SOLUTIONS_DIR}/database-solution.yml" <<'EOF'
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

# Set ownership
chown "${LAB_USER}:${LAB_USER}" "${WORKSPACE}/database.yml"
chown -R "${LAB_USER}:${LAB_USER}" "${SOLUTIONS_DIR}"

echo "Created database.yml template and solution file"
