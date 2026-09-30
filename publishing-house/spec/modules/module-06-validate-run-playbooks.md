# Module 06: Validate and run Ansible playbooks

### Brief Overview

This module teaches the two-step validation workflow for Ansible playbooks: yamllint for YAML syntax, then ansible-playbook --syntax-check for Ansible-specific structure. Participants will validate a real Apache configuration playbook, understand the difference between YAML syntax validation and Ansible structure validation, and optionally run the playbook to see it work. This completes the full workflow from YAML fundamentals to working Ansible automation.

### Audience and Time

- **Target personas:** Developers, system administrators, DevOps engineers, or anyone new to Ansible Automation Platform
- **Experience level:** Beginner
- **Prerequisites for this module:** Completion of Modules 1-5 (YAML syntax, data types, yamllint validation)
- **Estimated duration:** 10 minutes

### Learning Objectives

- Apply the two-step validation workflow: yamllint first, then Ansible syntax check
- Understand the difference between YAML syntax validation and Ansible-specific validation
- Validate a real Ansible playbook for both YAML correctness and Ansible structure
- Optionally run an Ansible playbook and observe successful execution

### Lab Structure

| Section | Title | Duration |
|---------|-------|----------|
| 1       | Two-step validation workflow explained | 2 min |
| 2       | Hands-on: Validate apache-playbook.yml | 5 min |
| 3       | Optional: Run the playbook and observe results | 3 min |

### Detailed Steps

1. Read the introduction to the two-step validation workflow for Ansible:
   - **Step 1:** Validate YAML syntax with yamllint (language-agnostic)
   - **Step 2:** Validate Ansible structure with ansible-playbook --syntax-check (Ansible-specific)
2. Understand why both steps are needed:
   - yamllint checks YAML syntax: indentation, data types, document markers, YAML best practices
   - ansible-playbook --syntax-check validates Ansible-specific structure: valid modules, required parameters, variable syntax, task structure
   - A file can pass yamllint but fail Ansible checks (valid YAML but invalid Ansible)
   - Always run yamllint first to catch syntax errors before Ansible parsing
3. Open the file `apache-playbook.yml` in VS Code
4. Review the playbook structure - this is a real Ansible playbook that installs and configures Apache web server
5. **Hands-on practice - Step 1:** Validate YAML syntax with yamllint
   - Open terminal and run: `yamllint apache-playbook.yml`
   - If yamllint returns no output, YAML syntax is valid ✓
   - If yamllint reports errors, fix them using the skills from Module 5 and re-run
6. **Hands-on practice - Step 2:** Validate Ansible structure
   - Run Ansible syntax check: `ansible-playbook --syntax-check apache-playbook.yml`
   - Read the output carefully:
     - Success message: `playbook: apache-playbook.yml` (no errors)
     - Error message: shows line number and describes Ansible-specific issue
7. Common Ansible-specific errors (not caught by yamllint):
   - Module name typos (e.g., `packag` instead of `package`)
   - Missing required parameters for modules
   - Invalid variable syntax
   - Incorrect task structure (missing `name`, wrong module parameter format)
8. If Ansible syntax check fails, fix the reported errors and re-run both validation steps
9. Confirm both yamllint and ansible-playbook --syntax-check pass with no errors
10. **Optional - Run the playbook:** Execute the validated playbook
    - Run: `ansible-playbook apache-playbook.yml`
    - Observe Ansible output showing each task executing
    - See the "PLAY RECAP" at the end showing success/failure counts
    - Verify Apache is installed (optional: `curl localhost` to see default Apache page)
11. Review the complete workflow: write YAML → validate with yamllint → validate with Ansible → run playbook

### Key Takeaways

- The two-step validation workflow ensures both YAML syntax and Ansible structure are correct
- Always run yamllint first to catch syntax errors before Ansible parsing attempts
- yamllint is language-agnostic (works for Kubernetes, Docker Compose, CI/CD) - Ansible checks are Ansible-specific
- ansible-playbook --syntax-check validates module names, parameters, and Ansible structure without executing tasks
- A playbook that passes both validation steps is ready to run safely
- This validation workflow is used by professionals across all YAML-based automation platforms

### Infrastructure Notes

- yamllint and ansible-playbook CLI tools must both be installed
- VS Code must have YAML syntax highlighting enabled and terminal available
- File `apache-playbook.yml` must be pre-created as a real Ansible playbook that:
  - Passes yamllint validation (valid YAML syntax)
  - Passes ansible-playbook --syntax-check (valid Ansible structure)
  - Optionally can be executed successfully (installs Apache httpd package and starts service)
- Recommend a simple playbook structure:
  ```yaml
  ---
  - name: Install and configure Apache web server
    hosts: localhost
    become: true
    tasks:
      - name: Install Apache package
        ansible.builtin.package:
          name: httpd
          state: present
      - name: Start Apache service
        ansible.builtin.service:
          name: httpd
          state: started
          enabled: true
  ```
- If zero-touch automation is added, validation should run both steps and verify exit code 0 for each
