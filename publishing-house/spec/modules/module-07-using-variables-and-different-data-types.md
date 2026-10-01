# Module 7: Using Variables and Different Data Types

## Learning Objective
Recognize YAML data types and use variables.

## Key Concepts
- Variables make playbooks reusable
- `vars:` section defines variables as dictionary
- YAML recognizes data types automatically (string, number, boolean)
- Jinja2 syntax for variable references (`{{ variable }}`)

## Hands-on Activity
- Add `vars:` section with 5 variables of different types
- Replace hard-coded values with variable references
- Understand type inference (80 → number, yes → boolean, httpd → string)
- Run and verify identical behavior

## Success Criteria
- Learner successfully adds variables section
- Correctly replaces values with variable references
- Playbook runs with identical behavior
- Understands different data types
