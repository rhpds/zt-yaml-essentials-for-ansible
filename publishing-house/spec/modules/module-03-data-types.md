# Module 03: YAML data types - dictionaries, lists, scalars, comments

### Brief Overview

This module introduces the core data structures used in YAML: scalars (simple values), lists (ordered collections), and dictionaries (key-value pairs). Participants will learn how to write each data type using proper YAML syntax and how to combine them to represent complex Ansible playbook structures. The module also covers YAML comments, which are essential for documenting playbooks and configurations. Understanding these data types is critical for writing and troubleshooting Ansible playbooks.

### Audience and Time

- **Target personas:** Developers, system administrators, DevOps engineers, or anyone new to Ansible Automation Platform
- **Experience level:** Beginner
- **Prerequisites for this module:** Completion of Module 2 (or understanding of YAML indentation and case sensitivity)
- **Estimated duration:** 12 minutes

### Learning Objectives

- Write YAML scalars (strings, numbers, booleans) following proper syntax
- Create YAML lists using both block style and inline flow style
- Define YAML dictionaries (key-value pairs) with correct indentation
- Add comments to YAML files for documentation purposes
- Combine dictionaries, lists, and scalars to represent Ansible playbook structures

### Lab Structure

| Section | Title | Duration |
|---------|-------|----------|
| 1       | Scalars: strings, numbers, and booleans | 3 min |
| 2       | Lists: block and flow styles | 3 min |
| 3       | Dictionaries: key-value pairs | 3 min |
| 4       | Comments and combining data types | 3 min |

### Detailed Steps

1. Navigate to the lab module page for YAML data types
2. Read the "Scalars" section explaining that scalars are single values: strings (quoted or unquoted), numbers, and booleans (`true`, `false`, `yes`, `no`)
3. View examples of scalar values in Ansible playbooks, such as task names (strings) and boolean flags
4. Read the "Lists" section explaining that lists are ordered collections of items, written with a dash (`-`) followed by a space
5. Observe examples of block-style lists (each item on a new line with a dash) and inline flow-style lists (e.g., `[item1, item2, item3]`)
6. Understand that Ansible tasks are typically written as lists of dictionaries
7. Read the "Dictionaries" section explaining that dictionaries are key-value pairs, where each key is followed by a colon and a space, then the value
8. View examples of nested dictionaries in Ansible playbooks, such as task parameters or variable definitions
9. Note that dictionary keys must be unique within their scope
10. Read the "Comments" section explaining that comments start with `#` and extend to the end of the line
11. Observe examples of comments used to document playbook sections, explain parameter choices, or disable tasks temporarily
12. Review examples showing combinations of data types: a list of dictionaries, dictionaries containing lists, and nested structures common in Ansible playbooks
13. Study a sample Ansible playbook snippet that combines scalars, lists, dictionaries, and comments

### Key Takeaways

- Scalars are single values: strings, numbers, or booleans
- Lists are ordered collections written with dashes (`-`) in block style or brackets in flow style
- Dictionaries are key-value pairs with unique keys within their scope
- Comments start with `#` and are essential for documenting YAML files
- Ansible playbooks combine these data types: tasks are lists of dictionaries, variables are dictionaries or lists, and scalars represent values
- Proper nesting and indentation are critical when combining data types

### Infrastructure Notes

VS Code should have YAML syntax highlighting enabled to help learners visually distinguish data types. Sample Ansible playbook files should be pre-loaded in the editor for reference. No execution or validation is required in this module (trust-based assessment).
