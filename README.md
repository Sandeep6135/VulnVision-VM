# Project 4: Continuous Compliance & Threat Exposure Engine
**Product Brand Name:** VulnVision 360  
**Domain:** Vulnerability Management (VM) & GRC

## Overview
VulnVision 360 provides a systematic process to continuously map the internal attack surface, prioritize risks via CVSS scores, and automate mandated configuration compliance checks. This repository contains the automation scripts required for asset discovery, compliance scanning, and closed-loop remediation.

## Core Capabilities
* **Continuous Discovery:** Automated Nmap sweeps to maintain a 100% accurate inventory of live assets and open ports.
* **Compliance Automation:** Utilization of OpenSCAP to automatically audit servers against stringent security-hardened standards (CIS Benchmarks).
* **Automated Remediation:** Infrastructure-as-Code (IaC) via Ansible to rapidly deploy patches for High/Critical CVEs across the server fleet, effectively closing the vulnerability lifecycle.

## Repository Contents
* `discovery/`: Scripts for aggressive network sweeping and XML inventory generation.
* `compliance/`: OpenSCAP automation for CIS Level 1 compliance reporting.
* `remediation/`: Ansible playbooks for zero-touch vulnerability patching.

*Trust No One. Verify Everything.*