# Module 04: Hands-on practice - write and fix YAML files

### Brief Overview

This module provides hands-on practice writing and troubleshooting YAML files in the context of Ansible playbooks. Participants will create valid YAML files from scratch, fix intentionally broken YAML examples, and validate their work by observing syntax highlighting and error messages in VS Code. Optionally, learners may run a simple Ansible playbook to confirm their YAML is correct. This module directly supports all three learning objectives and uses visible result verification (learners see immediate feedback when YAML is valid or invalid).

### Audience and Time

- **Target personas:** Developers, system administrators, DevOps engineers, or anyone new to Ansible Automation Platform
- **Experience level:** Beginner
- **Prerequisites for this module:** Completion of Modules 1-3 (understanding of YAML syntax, indentation, and data types)
- **Estimated duration:** 13 minutes

### Learning Objectives

- Create valid YAML files following proper syntax and indentation rules
- Write YAML dictionaries, lists, and scalars in Ansible playbooks
- Troubleshoot YAML syntax errors in Ansible configurations

### Lab Structure

| Section | Title | Duration |
|---------|-------|----------|
| 1       | Write a simple YAML file from scratch | 4 min |
| 2       | Fix YAML syntax errors in a broken playbook | 5 min |
| 3       | Validate YAML and optionally run a playbook | 4 min |

### Detailed Steps

1. Navigate to VS Code in the browser (the lab's main interface)
2. Open the file `practice-playbook.yml` (pre-created but empty or minimal)
3. Write a simple Ansible playbook from scratch with the following structure:
   - Document start marker (`---`)
   - A list containing one dictionary (a single task)
   - Task dictionary keys: `name` (string), `debug` (dictionary with `msg` key)
   - Proper indentation (2 spaces per level)
4. Save the file and observe syntax highlighting in VS Code to confirm YAML is valid (no red squiggly lines)
5. Open the file `broken-playbook.yml` (pre-created with intentional YAML syntax errors)
6. Read the instructions identifying common errors in the file: tab characters instead of spaces, inconsistent indentation, case mismatch in key names, missing colons, or incorrect list syntax
7. Fix each error one at a time, saving the file after each change to observe how VS Code's syntax highlighting responds
8. Continue fixing until all red squiggly lines (syntax errors) disappear in the editor
9. Optionally, validate the YAML structure using a command-line tool or Ansible's built-in syntax check (e.g., `ansible-playbook --syntax-check broken-playbook.yml`)
10. Optionally, run the corrected playbook using `ansible-playbook practice-playbook.yml` to see the output and confirm Ansible can parse the YAML successfully
11. Review a summary of common YAML mistakes and how to avoid them

### Key Takeaways

- Writing valid YAML requires attention to indentation (spaces only, consistent levels) and syntax (colons, dashes, case sensitivity)
- VS Code's syntax highlighting provides immediate feedback on YAML validity
- Common YAML errors include tab characters, inconsistent indentation, case mismatches, and missing punctuation
- Ansible's `--syntax-check` flag is a useful tool for validating playbooks before execution
- Hands-on practice is the best way to internalize YAML syntax rules

### Infrastructure Notes

- VS Code must have YAML syntax highlighting enabled (YAML language extension installed)
- Sample files `practice-playbook.yml` and `broken-playbook.yml` must be pre-created in the workspace
- Ansible Automation Platform must be configured with a simple inventory so playbooks can be executed (optional but recommended for full validation)
- If zero-touch automation (solve/validate buttons) is added in the future, this module should include automated YAML validity checks and playbook execution verification
