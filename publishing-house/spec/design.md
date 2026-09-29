# YAML Essentials for Ansible

<!-- This file is the design document for your lab or demo. -->
<!-- Fill in each section below, or run /rhdp-publishing-house to have the intake skill help. -->
<!-- Sections marked with [brackets] are placeholders — replace with real content. -->
<!-- The validation gate checks for all required sections before submission. -->

## Overview

This lab teaches the basics of YAML, a simple yet powerful data serialization language, with practical examples of how YAML is used within Ansible. YAML is the foundation of Ansible playbooks, and understanding its syntax is essential for anyone working with Ansible Automation Platform. Participants will write YAML files following proper syntax and indentation rules, work with YAML data structures (dictionaries, lists, and scalars), and troubleshoot common YAML syntax errors in an interactive VS Code environment.

## Target Audience

- **Role:** Developers, system administrators, DevOps engineers, or anyone new to Ansible Automation Platform
- **Experience level:** Beginner
- **What they already know:** No prior knowledge of YAML or Ansible is required. Basic familiarity with text editors is helpful but not mandatory.
- **What they don't know:** YAML syntax, structure, and how YAML is used in Ansible playbooks

## Prerequisites

None. This lab is designed for learners with no prior YAML or Ansible experience.

- **Can the lab validate these automatically?** No — zero prerequisites means no validation is needed.

## Learning Objectives

1. Create valid YAML files following proper syntax and indentation rules
2. Write YAML dictionaries, lists, and scalars in Ansible playbooks
3. Troubleshoot YAML syntax errors in Ansible configurations

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
| 4 | Hands-on practice - write and fix YAML files | 13 min |
| — | **Total hands-on** | **45 min** |
| — | Intro / presentation | ~5 min |
| — | **Total lab** | **~50 min** |

## Difficulty Level

Beginner

## Environment

**Learner view:** When the lab starts, participants see VS Code (or a similar code editor) in their browser with a pre-configured OpenShift cluster running in the background. Ansible Automation Platform is already installed and ready to use. The focus is on the editor — participants will write and edit YAML files directly in VS Code.

**Automation needed:** Yes

The automation must provision:
- A working OpenShift cluster (accessible but not the primary focus)
- Red Hat Ansible Automation Platform installed and configured
- VS Code or a web-based editor (such as VS Code in the browser via code-server) with YAML syntax highlighting enabled
- Sample Ansible playbook files for participants to edit and experiment with
- A simple Ansible inventory and configuration so learners can optionally run a playbook (if time permits)

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
