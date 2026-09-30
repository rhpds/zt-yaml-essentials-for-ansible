# Module 02: YAML syntax basics - files, indentation, case sensitivity

### Brief Overview

This module teaches the fundamental syntax rules that govern all YAML files. Participants will learn how YAML files are structured, the critical importance of indentation, and how case sensitivity affects YAML parsing. These foundational concepts are essential for writing valid YAML and avoiding the most common syntax errors in Ansible playbooks. Learners will see examples of correct and incorrect syntax to build a strong mental model before hands-on practice.

### Audience and Time

- **Target personas:** Developers, system administrators, DevOps engineers, or anyone new to Ansible Automation Platform
- **Experience level:** Beginner
- **Prerequisites for this module:** Completion of Module 1 (or basic understanding of what YAML is)
- **Estimated duration:** 12 minutes

### Learning Objectives

- Identify the basic structure of a YAML file (documents, directives, spacing)
- Apply proper indentation rules when writing YAML
- Recognize how case sensitivity affects key names and values in YAML

### Lab Structure

| Section | Title | Duration |
|---------|-------|----------|
| 1       | YAML file structure and document markers | 3 min |
| 2       | Indentation rules and the whitespace trap | 4 min |
| 3       | Case sensitivity and comments | 2 min |
| 4       | Hands-on: Write your first valid YAML file | 3 min |

### Detailed Steps

1. Navigate to the lab module page for YAML syntax basics
2. Read the "YAML file structure" section explaining that YAML files typically start with `---` (document start marker) and may end with `...` (optional document end marker)
3. Observe examples of single-document and multi-document YAML files
4. Read the "Indentation rules" section explaining that YAML **forbids tabs** for indentation (YAML parsers reject tabs) and requires spaces only
5. Understand that indentation level defines structure and nesting - each level typically uses 2 spaces
6. View side-by-side examples showing correct indentation (2 spaces per level) versus incorrect indentation (mixing tabs and spaces, inconsistent spacing)
7. **Learn the "whitespace trap"** - see an example where indentation looks right but fails because whitespace alone doesn't create hierarchy:
   ```yaml
   - name: Configure Apache
     package: httpd
     service: httpd
   ```
   This looks organized but YAML treats `package` and `service` as values of `name`, not separate keys. Proper structure requires explicit nesting with colons.
8. Understand that indentation errors are the most common cause of YAML parsing failures
9. Read the "Case sensitivity" section explaining that YAML treats `Name`, `name`, and `NAME` as three different keys
10. Observe examples demonstrating how case mismatches cause Ansible to fail or produce unexpected results
11. Learn about comments: lines starting with `#` extend to end of line and are ignored by parsers
12. Review a summary checklist of YAML syntax rules: spaces only (tabs forbidden), consistent indentation creates structure, match case exactly, use `#` for comments
13. **Hands-on practice:** Open VS Code and the file `syntax-practice.yml`
14. Write a simple valid YAML file with proper structure:
    - Add document start marker `---`
    - Create 2-3 key-value pairs with simple string values
    - Use proper indentation (2 spaces)
    - Add a comment explaining what the file contains
15. Save the file and observe VS Code syntax highlighting confirms valid YAML (no red squiggly lines)
16. Verify the file follows all syntax rules learned in this module

### Key Takeaways

- YAML files use `---` to mark the start of a document
- Indentation in YAML must use spaces (not tabs) and be consistent throughout the file
- Indentation level determines the structure and nesting of YAML data
- YAML is case-sensitive: `name` and `Name` are not the same
- Proper indentation and case consistency are critical for valid YAML

### Infrastructure Notes

VS Code must have YAML syntax highlighting enabled. Sample file `syntax-practice.yml` should be pre-created as an empty file or minimal stub for learners to write in. This module uses visible result verification (VS Code highlighting shows valid/invalid YAML) for the hands-on section.
