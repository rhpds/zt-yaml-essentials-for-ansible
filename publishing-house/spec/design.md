# YAML Essentials for Ansible

<!-- This file is the design document for your lab or demo. -->
<!-- Fill in each section below, or run /rhdp-publishing-house to have the intake skill help. -->
<!-- Sections marked with [brackets] are placeholders — replace with real content. -->
<!-- The validation gate checks for all required sections before submission. -->

## Overview

Red Hat Ansible Automation Platform is an end-to-end automation platform for configuring systems, deploying software, and orchestrating advanced workflows. It includes the tools and resources necessary to create, manage, and scale automation across the entire enterprise.

Red Hat Ansible Automation Platform uses YAML for content because it offers a straightforward, human-readable way to write Ansible configurations, tasks, and Playbooks. Understanding YAML is essential for anyone working with Red Hat Ansible Automation Platform.

This learning path teaches the basics of YAML with practical examples of how it is used within Red Hat Ansible Automation Platform. Participants will write YAML files following proper syntax and indentation rules, work with YAML data structures (dictionaries, lists, and scalars), and troubleshoot common YAML syntax errors using industry-standard validation tools in an interactive VS Code environment.

## Target Audience

- **Role:** Developers, system administrators, DevOps engineers, or anyone new to Red Hat Ansible Automation Platform
- **Experience level:** Beginner
- **What they already know:** No prior knowledge of YAML or Ansible is required. Basic familiarity with text editors is helpful but not mandatory.
- **What they don't know:** YAML syntax, structure, and how YAML is used in Red Hat Ansible Automation Platform Playbooks and configurations

## Prerequisites

None. This lab is designed for learners with no prior YAML or Ansible experience.

- **Can the lab validate these automatically?** No — zero prerequisites means no validation is needed.

## Learning Objectives

1. Create valid YAML files following proper syntax and indentation rules for Red Hat Ansible Automation Platform
2. Write YAML dictionaries, lists, and scalars in Ansible Playbooks
3. Troubleshoot YAML syntax errors in Red Hat Ansible Automation Platform configurations using yamllint

## Content Type

Lab (hands-on)

## Products & Technologies

- Red Hat Ansible Automation Platform

## Module Map

| Module | Title | Duration |
|--------|-------|----------|
| 1 | Why YAML? Introduction and advantages | 8 min |
| 2 | YAML syntax basics - files, indentation, case sensitivity | 12 min |
| 3 | YAML data types - dictionaries, lists, scalars, comments | 12 min |
| 4 | Write and validate YAML with yamllint | 10 min |
| 5 | Fix broken YAML using yamllint feedback | 10 min |
| 6 | Validate and run Ansible playbooks | 10 min |
| — | **Total hands-on** | **62 min** |
| — | **Total learning path** | **~60 min** |

## Difficulty Level

Beginner

## Environment

**Learner view:** When the learning path starts, participants see VS Code in their browser with a pre-configured RHEL control node. Red Hat Ansible Automation Platform CLI tools (ansible-playbook, ansible-navigator) and yamllint are already installed and ready to use. The focus is on the editor and terminal — participants will write and validate YAML files directly in VS Code, using yamllint and Ansible validation tools via the integrated terminal.

**Automation needed:** Yes

The automation must provision:
- RHEL 9.5 control node with VS Code (code-server) accessible in browser
- Red Hat Ansible Automation Platform CLI tools installed (ansible-playbook, ansible-navigator)
- yamllint installed and configured with beginner-friendly rules
- VS Code with YAML syntax highlighting enabled
- Sample YAML files pre-created in workspace:
  - `syntax-practice.yml` (empty stub for Module 02)
  - `data-types-practice.yml` (empty stub for Module 03)
  - `practice.yaml` (empty stub for Module 04)
  - `broken.yml` (intentionally broken with multiple error types for Module 05)
  - `apache-playbook.yml` (valid Ansible playbook for Module 06)
- Simple Ansible inventory configured for localhost execution

## Infrastructure Requirements

- **Cloud provider:** CNV (OpenShift Virtualization)
- **Platform:** RHEL VMs (provisioned via CNV)
- **Per-student VMs:** 1 control node (RHEL 9.5, 2 vCPU, 4GB RAM, 20GB disk) with VS Code and ansible-navigator pre-installed
- **Topology:** Per-student (each learner gets their own VM)
- **Automation approach:** Ansible (setup scripts to configure VS Code, sample YAML files, and ansible-navigator environment)
- **AI/MaaS:** None
- **External services:** `quay.io` (for ansible-navigator execution environment images), `cdn.redhat.com` (for RHEL registration and packages)
- **AAP version:** Not applicable (using ansible-navigator CLI instead of AAP controller)
- **Non-GA products:** None (all products are GA)

## Assessment Strategy

This lab uses a combination of hands-on verification and trust-based assessment:

- **Module 1:** Trust-based — learners read about YAML advantages
- **Module 2:** Trust-based — learners understand YAML syntax rules
- **Module 3:** Trust-based — learners understand YAML data types
- **Module 4:** Visible result verification — learners write YAML files and fix syntax errors. Success is visible when their YAML parses correctly (no syntax errors shown in the editor) and, optionally, when they successfully run a simple Ansible playbook.

Zero-touch automation (solve/validate buttons) could be added for Module 4 to automatically check YAML validity, but the initial design relies on learners seeing immediate feedback in the editor (syntax highlighting, error messages).
