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
| 1       | YAML file structure and document markers | 4 min |
| 2       | Indentation rules and whitespace | 5 min |
| 3       | Case sensitivity in YAML | 3 min |

### Detailed Steps

1. Navigate to the lab module page for YAML syntax basics
2. Read the "YAML file structure" section explaining that YAML files typically start with `---` (document start marker) and may end with `...` (optional document end marker)
3. Observe examples of single-document and multi-document YAML files
4. Read the "Indentation rules" section explaining that YAML uses spaces (not tabs) for indentation and that indentation level defines structure and nesting
5. View side-by-side examples showing correct indentation (2 spaces per level) versus incorrect indentation (mixing tabs and spaces, inconsistent spacing)
6. Understand that indentation errors are the most common cause of YAML parsing failures
7. Read the "Case sensitivity" section explaining that YAML treats `Name`, `name`, and `NAME` as three different keys
8. Observe examples demonstrating how case mismatches cause Ansible to fail or produce unexpected results
9. Review a summary checklist of YAML syntax rules: use spaces not tabs, be consistent with indentation, and match case exactly

### Key Takeaways

- YAML files use `---` to mark the start of a document
- Indentation in YAML must use spaces (not tabs) and be consistent throughout the file
- Indentation level determines the structure and nesting of YAML data
- YAML is case-sensitive: `name` and `Name` are not the same
- Proper indentation and case consistency are critical for valid YAML

### Infrastructure Notes

VS Code should have YAML syntax highlighting enabled. Sample YAML files may be provided in the editor to illustrate correct and incorrect syntax, but no execution or validation is required in this module (trust-based assessment).
