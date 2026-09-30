# Module 05: Fix broken YAML using yamllint feedback

### Brief Overview

This module gives learners intensive practice reading yamllint error messages and fixing common YAML syntax errors. Participants will work with an intentionally broken YAML file containing multiple error types (tabs, inconsistent indentation, trailing spaces, missing syntax elements) and fix each issue one at a time using yamllint's specific feedback. This mirrors real-world debugging workflows and builds confidence in interpreting error messages.

### Audience and Time

- **Target personas:** Developers, system administrators, DevOps engineers, or anyone new to Ansible Automation Platform
- **Experience level:** Beginner
- **Prerequisites for this module:** Completion of Module 4 (yamllint installation and basic validation workflow)
- **Estimated duration:** 10 minutes

### Learning Objectives

- Interpret yamllint error messages to identify specific YAML syntax issues
- Fix common YAML errors: tab characters, inconsistent indentation, trailing spaces, missing syntax
- Use the iterative fix-validate cycle to debug YAML files
- Recognize patterns in YAML syntax errors and their solutions

### Lab Structure

| Section | Title | Duration |
|---------|-------|----------|
| 1       | Run yamllint on broken.yml and read error messages | 2 min |
| 2       | Hands-on: Fix YAML errors iteratively | 6 min |
| 3       | Verify all errors resolved and review common mistakes | 2 min |

### Detailed Steps

1. Open the file `broken.yml` in VS Code (pre-created with intentional YAML syntax errors)
2. Before running yamllint, scan the file visually - can you spot any issues?
3. Open a terminal and run yamllint on the broken file: `yamllint broken.yml`
4. Read the yamllint error messages carefully - there will be multiple errors listed
5. Understand the error output format: `broken.yml:5:3: [error] trailing spaces (trailing-spaces)`
   - `5` = line number
   - `3` = column number
   - `[error]` = severity level
   - `trailing spaces` = description
   - `(trailing-spaces)` = error type/rule name
6. Common error types yamllint will report in this file:
   - **Tab characters** - YAML forbids tabs for indentation
   - **Inconsistent indentation** - mixing 2-space and 4-space levels
   - **Trailing whitespace** - spaces at the end of lines
   - **Missing document start** - no `---` marker at top
   - **Line too long** - exceeds recommended length (typically 80-120 chars)
   - **Missing space after colon** - `key:value` should be `key: value`
   - **Wrong indentation** - incorrect number of spaces for nesting level
7. **Hands-on practice:** Fix errors one at a time using this workflow:
   - Pick the **first error** in yamllint output (typically at top of file)
   - Navigate to that line number in VS Code
   - Identify the specific issue at the column indicated
   - Fix the error:
     - Replace tabs with spaces (use Find & Replace: `\t` → two spaces)
     - Fix indentation to be consistent (2 spaces per level)
     - Add `---` document start marker at line 1
     - Remove trailing whitespace (delete spaces at end of lines)
     - Add space after colons: `key:value` → `key: value`
   - Save the file
   - Re-run `yamllint broken.yml`
   - Confirm that error is gone and move to the next error
8. Continue the fix-validate cycle until yamllint returns **no output** (clean pass)
9. Review the corrected file and compare it to the original broken version
10. Identify which errors were hardest to spot visually vs. easy for yamllint to catch
11. Review summary of common YAML mistakes and how to fix them

### Key Takeaways

- yamllint error messages include line:column location for precise debugging
- Tab characters are the most common YAML error - YAML parsers forbid tabs entirely
- Inconsistent indentation breaks YAML structure - always use 2 spaces per level consistently
- Trailing whitespace is invisible but causes yamllint warnings - clean code hygiene matters
- The iterative fix-validate cycle (fix one error, re-run yamllint, repeat) prevents creating new errors
- yamllint catches errors that are hard to spot visually (tabs, trailing spaces, subtle indentation issues)

### Infrastructure Notes

- yamllint must be installed on the control node
- VS Code must have YAML syntax highlighting enabled and a terminal available
- File `broken.yml` must be pre-created with intentional errors:
  - Tab characters (at least 2 instances)
  - Inconsistent indentation (mixing 2-space and 4-space, or wrong nesting levels)
  - Trailing whitespace (at least 3 lines)
  - Missing document start marker `---`
  - Missing space after colon in at least 2 key-value pairs
  - Optional: One line exceeding 120 characters
- Recommend including 8-10 total errors across different types for comprehensive practice
- If zero-touch automation (solve/validate buttons) is added, validation task should run `yamllint broken.yml` and check exit code is 0 (all errors fixed)
