# Module 04: Write and validate YAML with yamllint

### Brief Overview

This module introduces yamllint as a professional YAML validation tool and gives learners hands-on practice writing valid YAML from scratch. Participants will install yamllint, write a practice YAML file with proper structure, and validate it using yamllint. This module emphasizes the workflow of write-validate-fix that professionals use for YAML files across all platforms (Kubernetes, Ansible, CI/CD). Uses visible result verification (yamllint output shows pass/fail).

### Audience and Time

- **Target personas:** Developers, system administrators, DevOps engineers, or anyone new to Ansible Automation Platform
- **Experience level:** Beginner
- **Prerequisites for this module:** Completion of Modules 1-3 (understanding of YAML syntax, indentation, data types)
- **Estimated duration:** 10 minutes

### Learning Objectives

- Install and verify yamllint as a YAML validation tool
- Write a valid YAML file from scratch using proper syntax
- Use yamllint to validate YAML syntax and confirm no errors
- Understand yamllint output format (no output = success, errors show line:column format)

### Lab Structure

| Section | Title | Duration |
|---------|-------|----------|
| 1       | Install and verify yamllint | 2 min |
| 2       | Hands-on: Write practice.yaml from scratch | 5 min |
| 3       | Validate with yamllint and interpret output | 3 min |

### Detailed Steps

1. Navigate to VS Code in the browser (the lab's main interface)
2. Open a terminal in VS Code (View > Terminal or Ctrl+`)
3. Verify yamllint is installed by running: `yamllint --version`
4. Read the brief introduction to yamllint:
   - A linter for YAML files that checks syntax, indentation, line length, and best practices
   - Industry-standard tool used across Kubernetes, Docker Compose, CI/CD pipelines, and Ansible
   - Provides detailed error messages with line and column numbers
5. Understand yamllint output format:
   - **No output** = valid YAML (success)
   - **Errors** show `file:line:column: [error type] message` format
6. Open the file `practice.yaml` (empty or minimal stub)
7. **Hands-on practice:** Write a valid YAML file from scratch with the following structure:
   - Document start marker `---`
   - A top-level dictionary with 3-4 key-value pairs (use generic keys: `name`, `description`, `version`, `enabled`)
   - Include a nested dictionary under one key (e.g., `config:` with sub-keys)
   - Include a list under another key (e.g., `items:` with 3-4 list items)
   - Use proper indentation (2 spaces per level)
   - Add a comment explaining what the file represents
8. Save the file
9. Run yamllint to validate: `yamllint practice.yaml`
10. If yamllint returns **no output**, your YAML is valid - success!
11. If yamllint returns errors, read the error messages carefully:
    - Note the line number and column number
    - Identify the specific issue (indentation, missing colon, trailing space, etc.)
    - Fix the error and re-run yamllint
12. Continue the write-validate-fix cycle until yamllint passes with no output
13. Review the completed valid YAML file and confirm it follows all syntax rules from Modules 2-3

### Key Takeaways

- yamllint is the industry-standard tool for validating YAML syntax before files reach application-specific tools
- yamllint output format: no output means success, errors include line:column location for easy debugging
- The write-validate-fix workflow with yamllint catches syntax errors early in the development process
- yamllint is language-agnostic and works for any YAML file, not just Ansible
- Valid YAML requires proper indentation (2 spaces), document markers, and correct syntax for data types

### Infrastructure Notes

- yamllint must be installed on the control node (via setup-automation): `dnf install -y yamllint` or `pip install yamllint`
- VS Code must have YAML syntax highlighting enabled and a terminal available
- File `practice.yaml` should be pre-created as an empty file or minimal stub (just `---` to start)
- Optional: Create a `.yamllint` config file in the learner's home directory with beginner-friendly rules (line length: 120, indentation: 2 spaces, document-start: require)
- If zero-touch automation (solve/validate buttons) is added, validation task should run `yamllint practice.yaml` and check exit code is 0 (success)
