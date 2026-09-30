# Module 04: Validate and fix YAML with yamllint

### Brief Overview

This module teaches learners how to use yamllint as a professional YAML validation tool. Participants will install and run yamllint to catch syntax errors, interpret yamllint error messages, fix intentionally broken YAML files based on specific feedback, and understand the two-step validation workflow for Ansible playbooks (yamllint for YAML syntax, then ansible-playbook --syntax-check for Ansible structure). This module emphasizes the industry-standard tooling used across Kubernetes, CI/CD, and automation platforms - not just Ansible. Uses visible result verification (yamllint output shows pass/fail).

### Audience and Time

- **Target personas:** Developers, system administrators, DevOps engineers, or anyone new to Ansible Automation Platform
- **Experience level:** Beginner
- **Prerequisites for this module:** Completion of Modules 1-3 (understanding of YAML syntax, indentation, and data types)
- **Estimated duration:** 13 minutes

### Learning Objectives

- Use yamllint to validate YAML syntax and identify errors
- Interpret yamllint error messages to pinpoint exact line and column of issues
- Fix YAML syntax errors based on yamllint feedback
- Apply the two-step validation workflow: yamllint first, then Ansible-specific validation

### Lab Structure

| Section | Title | Duration |
|---------|-------|----------|
| 1       | Install and verify yamllint | 2 min |
| 2       | Fix broken YAML using yamllint error messages | 6 min |
| 3       | Two-step validation: yamllint + Ansible syntax check | 5 min |

### Detailed Steps

1. Navigate to VS Code in the browser (the lab's main interface)
2. Open a terminal in VS Code (View > Terminal or Ctrl+`)
3. Verify yamllint is installed by running: `yamllint --version`
4. Read the brief introduction to yamllint: a linter for YAML files that checks syntax, indentation, line length, and YAML best practices
5. Understand yamllint output format: no output means valid YAML; errors show file:line:column format with specific issue descriptions
6. Open the file `broken.yml` (pre-created with intentional YAML syntax errors)
7. Run yamllint on the broken file: `yamllint broken.yml`
8. Read the yamllint error messages carefully - note the line number, column number, and error type for each issue
9. Common errors yamllint will catch in this file:
   - Tab characters instead of spaces
   - Inconsistent indentation (mixing 2-space and 4-space levels)
   - Trailing whitespace at end of lines
   - Missing document start marker `---`
   - Line too long (exceeds recommended length)
   - Missing space after colon in key-value pairs
10. Fix each error one at a time based on yamllint feedback:
    - Replace tabs with spaces (use Find & Replace in VS Code if needed)
    - Fix indentation levels to be consistent (2 spaces per level)
    - Add document start marker `---` at the top
    - Remove trailing whitespace
    - Break long lines or accept the warning
11. Re-run `yamllint broken.yml` after each fix to confirm the error is resolved
12. Continue the fix-validate cycle until yamllint returns no output (clean pass)
13. Open `apache-playbook.yml` (a real Ansible playbook that may have both YAML and Ansible issues)
14. Run the **two-step validation workflow**:
    - **Step 1**: Validate YAML syntax with yamllint: `yamllint apache-playbook.yml`
    - **Step 2**: Validate Ansible structure with: `ansible-playbook --syntax-check apache-playbook.yml`
15. Understand the difference between the two tools:
    - yamllint checks YAML syntax (language-agnostic: works for Kubernetes, Docker Compose, CI/CD configs)
    - ansible-playbook --syntax-check validates Ansible-specific structure (tasks, modules, parameters, variable usage)
16. Fix any issues found by yamllint first, then address any Ansible-specific issues
17. Verify both tools pass with no errors
18. Review key takeaways: yamllint is the first line of defense for all YAML files, catching syntax errors before they reach application-specific tools

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
- VS Code must have YAML syntax highlighting enabled and a terminal available
- Sample files must be pre-created in the workspace:
  - `broken.yml` (intentionally broken with multiple error types: tabs, inconsistent indentation, trailing spaces, missing document marker, missing space after colon, line too long)
  - `apache-playbook.yml` (a real Ansible playbook that should pass yamllint but may need Ansible-specific fixes for --syntax-check)
- Optional: Create a `.yamllint` config file in the learner's home directory with beginner-friendly rules (line length: 120, indentation: 2 spaces, document-start: require)
- Ansible CLI tools (ansible-playbook) must be available for the `--syntax-check` validation step
- If zero-touch automation (solve/validate buttons) is added in the future, validation tasks should:
  1. Run `yamllint broken.yml` and check exit code is 0 (success)
  2. Run `yamllint apache-playbook.yml && ansible-playbook --syntax-check apache-playbook.yml` and verify both pass
