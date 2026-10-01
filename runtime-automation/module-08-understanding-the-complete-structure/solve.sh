#!/bin/bash
# Module 8 Solve - Ensures annotated file exists (read-only module, no changes needed)

WORKSPACE="/home/rhel/yaml-practice"
LAB_USER="rhel"

echo "Checking Module 8..."

if [ -f "${WORKSPACE}/webserver-annotated.yml" ]; then
  echo "✓ webserver-annotated.yml exists"
  echo "Module 8 is a visualization module - review the annotated structure"
  echo "No solve needed - this module teaches understanding, not editing"
else
  echo "ERROR: webserver-annotated.yml should have been created by module setup"
  exit 1
fi
