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
| 1       | Scalars: strings, numbers, and booleans | 2 min |
| 2       | Lists: block and flow styles | 2 min |
| 3       | Dictionaries: key-value pairs and nesting | 2 min |
| 4       | Multi-line strings | 2 min |
| 5       | Hands-on: Write YAML data types | 4 min |

### Detailed Steps

1. Navigate to the lab module page for YAML data types
2. Read the "Scalars" section explaining that scalars are single values: strings (quoted or unquoted), numbers, and booleans (`true`, `false`, `yes`, `no`)
3. Learn when to use quotes: forcing non-string data as strings, preserving special characters, or escaping colons in strings
4. View examples of scalar values in Ansible playbooks, such as task names (strings) and boolean flags
5. Read the "Lists" section explaining that lists are ordered collections of items, written with a dash (`-`) followed by a space
6. Observe examples of block-style lists (each item on a new line with a dash) and inline flow-style lists using bracket notation: `[item1, item2, item3]`
7. Understand that Ansible tasks are typically written as lists of dictionaries (block style preferred for readability)
8. Read the "Dictionaries" section explaining that dictionaries are key-value pairs, where each key is followed by a colon and space, then the value
9. View examples of nested dictionaries in Ansible playbooks, such as task parameters or variable definitions
10. Learn the flow-style notation for compact dictionaries: `{key: value, key2: value2}`
11. Note that dictionary keys must be unique within their scope
12. Read the "Multi-line strings" section covering block content operators:
    - Pipe (`|`) preserves newlines - useful for scripts or multi-line configuration content
    - Greater-than (`>`) folds newlines into spaces - useful for long descriptive text
13. View examples using block operators in Ansible tasks (shell commands, template content)
14. Review examples showing combinations of data types: a list of dictionaries, dictionaries containing lists, and nested structures common in Ansible playbooks
15. Study a sample Ansible playbook snippet that combines scalars, lists, dictionaries, multi-line strings, and comments
16. **Hands-on practice:** Open the file `data-types-practice.yml` in VS Code
17. Write YAML demonstrating each data type learned:
    - Create a scalar (string value for a key like `name` or `description`)
    - Write a list using block style (dashes, one item per line) with at least 3 items
    - Write a dictionary with nested key-value pairs (2 levels deep)
    - Add a multi-line string using pipe (`|`) operator showing multiple lines preserved
    - Combine data types: create a dictionary that contains both a scalar value and a list
18. Verify proper indentation and syntax using VS Code highlighting
19. Compare your work to the example snippet shown earlier in the module

### Key Takeaways

- Scalars are single values: strings, numbers, or booleans - use quotes when forcing types or preserving special characters
- Lists are ordered collections written with dashes (`-`) in block style or brackets `[item1, item2]` in flow style
- Dictionaries are key-value pairs with unique keys - use colon-space syntax in block style or braces `{key: value}` in flow style
- Multi-line strings use pipe (`|`) to preserve newlines or greater-than (`>`) to fold lines into spaces
- Comments start with `#` and are essential for documenting YAML files
- Ansible playbooks combine these data types: tasks are lists of dictionaries, variables are dictionaries or lists, and scalars represent values
- Block style (indented with line breaks) is preferred for readability; flow style (compact inline) is valid but harder to read in complex structures
- Proper nesting and indentation are critical when combining data types

### Infrastructure Notes

VS Code must have YAML syntax highlighting enabled to help learners visually distinguish data types. Sample Ansible playbook files should be pre-loaded in the editor for reference. File `data-types-practice.yml` should be pre-created as an empty file or minimal stub for learners to practice writing data structures. This module uses visible result verification (VS Code highlighting confirms valid YAML syntax) for the hands-on section.
