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
| 1       | Write a simple YAML file and validate with yamllint | 5 min |
| 2       | Fix YAML syntax errors using yamllint feedback | 5 min |
| 3       | Validate Ansible playbook structure and syntax | 3 min |

### Detailed Steps

1. Navigate to VS Code in the browser (the lab's main interface)
2. Open a terminal in VS Code (View > Terminal or Ctrl+`)
3. Verify yamllint is installed by running: `yamllint --version`
4. Open the file `practice.yml` (pre-created but empty or minimal)
5. Write a simple YAML file from scratch with basic structure:
   - Document start marker (`---`)
   - A dictionary with key-value pairs (use generic keys like `foo`, `bar`, `items`)
   - A nested list under one of the keys
   - Proper indentation (2 spaces per level)
6. Save the file and run yamllint to validate: `yamllint practice.yml`
7. Observe yamllint output - if valid, it returns no output (success); if invalid, it shows line/column of errors
8. Open the file `broken.yml` (pre-created with intentional YAML syntax errors)
9. Run yamllint on the broken file: `yamllint broken.yml`
10. Read yamllint error messages identifying specific problems: tab characters, inconsistent indentation, trailing spaces, missing document start marker, line too long, etc.
11. Fix each error one at a time based on yamllint feedback:
    - Replace tabs with spaces
    - Fix indentation levels to be consistent (2 spaces)
    - Add document start marker `---`
    - Remove trailing whitespace
12. Re-run `yamllint broken.yml` after each fix to confirm the error is resolved
13. Continue fixing until yamllint returns no output (clean validation)
14. Open `apache-playbook.yml` (a real Ansible playbook with YAML structure issues)
15. Run the two-step validation workflow:
    - **Step 1**: Validate YAML syntax with yamllint: `yamllint apache-playbook.yml`
    - **Step 2**: Validate Ansible structure with: `ansible-playbook --syntax-check apache-playbook.yml`
16. Understand the difference: yamllint checks YAML syntax (language-agnostic), while `--syntax-check` validates Ansible-specific structure (tasks, modules, parameters)
17. Fix any remaining issues and re-validate with both tools
18. Review a summary of the validation workflow: yamllint first (catch syntax errors), then ansible-playbook --syntax-check (validate Ansible structure)

### Key Takeaways

- Writing valid YAML requires attention to indentation (spaces only, consistent levels) and syntax (colons, dashes, case sensitivity)
- yamllint is a powerful validation tool that catches YAML syntax errors before passing files to Ansible
- yamllint provides detailed error messages with line and column numbers, making debugging fast and precise
- Common YAML errors yamllint catches: tab characters, inconsistent indentation, trailing spaces, missing document markers, line length
- The two-step validation workflow ensures both YAML syntax and Ansible structure are correct:
  1. `yamllint file.yml` - validates YAML syntax (language-agnostic)
  2. `ansible-playbook --syntax-check file.yml` - validates Ansible-specific structure
- yamllint is language-agnostic and works for any YAML file (Kubernetes, Docker Compose, CI/CD configs) - not just Ansible
- Hands-on practice with real error messages is the best way to internalize YAML syntax rules

### Infrastructure Notes

- yamllint must be installed on the control node (via setup-automation): `dnf install -y yamllint` or `pip install yamllint`
- VS Code must have YAML syntax highlighting enabled (YAML language extension installed)
- Sample files must be pre-created in the workspace:
  - `practice.yml` (empty or minimal stub for learners to write from scratch)
  - `broken.yml` (intentionally broken with tab characters, inconsistent indentation, trailing spaces, no document marker)
  - `apache-playbook.yml` (a real Ansible playbook with both YAML syntax issues and Ansible structure to validate)
- Optional: Create a `.yamllint` config file in the learner's home directory with beginner-friendly rules (reasonable line length limit, 2-space indentation enforcement)
- Ansible Automation Platform CLI tools (ansible-playbook) must be available for the `--syntax-check` validation step
- If zero-touch automation (solve/validate buttons) is added in the future, validation tasks should run yamllint and ansible-playbook --syntax-check against learner-created files
