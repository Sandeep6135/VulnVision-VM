# VulnVision 360

Continuous vulnerability management and compliance automation for a small Linux lab environment.

## Overview

VulnVision 360 ties together asset discovery, vulnerability scanning, compliance checks, and remediation into a closed-loop workflow. The repository is intentionally lightweight: Bash scripts handle discovery and compliance, Docker Compose provides the scanner stack, and Ansible remediates critical findings.

## What it does

- Discovers live hosts and services with Nmap
- Runs OpenVAS-based vulnerability assessment
- Checks CIS-aligned compliance with OpenSCAP
- Applies remediation through Ansible playbooks
- Re-scans to verify fixes and track risk reduction

## Workflow

1. Discover assets with [discovery/asset_discovery.sh](discovery/asset_discovery.sh)
2. Run vulnerability scans with the OpenVAS container from [docker-compose.yml](docker-compose.yml)
3. Generate compliance reports with [compliance/oscap_cis_scan.sh](compliance/oscap_cis_scan.sh)
4. Patch critical issues with [remediation/patch_critical_cve.yml](remediation/patch_critical_cve.yml)
5. Re-scan and compare results

## Architecture

```text
Network assets
  -> Nmap discovery
  -> OpenVAS / GVM assessment
  -> CVSS risk prioritization
  -> OpenSCAP compliance checks
  -> Ansible remediation
  -> Verification scan
```

## Stack

| Layer | Tool | Purpose |
| --- | --- | --- |
| Discovery | Nmap | Identify live hosts, ports, and services |
| Vulnerability scanning | OpenVAS / GVM | Detect CVEs and severity |
| Compliance | OpenSCAP | Check CIS-style hardening rules |
| Remediation | Ansible | Apply targeted fixes |
| Runtime | Docker Compose | Start scanner dependencies |

## Repository layout

```text
VulnVision-VM/
├── ARCHITECTURE.md
├── DEPLOYMENT_AND_TESTING.md
├── docker-compose.yml
├── discovery/
│   └── asset_discovery.sh
├── compliance/
│   └── oscap_cis_scan.sh
└── remediation/
    ├── inventory.ini
    └── patch_critical_cve.yml
```

## Prerequisites

- Linux host or WSL2 with Bash
- Docker and Docker Compose
- Nmap
- OpenSCAP
- Ansible
- Access to the target network and required credentials for authenticated scans

## Quick start

```bash
git clone <repo-url>
cd VulnVision-VM
docker-compose up -d

mkdir -p reports/discovery reports/compliance
bash discovery/asset_discovery.sh
bash compliance/oscap_cis_scan.sh
```

## Expected outputs

- `reports/discovery/final_asset_inventory.xml`
- `reports/discovery/nmap_human_readable.txt`
- `reports/compliance/oscap_results.xml`
- `reports/compliance/cis_compliance_report.html`
- `reports/remediation_log.txt`

## Remediation

The Ansible inventory in [remediation/inventory.ini](remediation/inventory.ini) defines the target hosts. The playbook in [remediation/patch_critical_cve.yml](remediation/patch_critical_cve.yml) updates OpenSSH and OpenSSL on the `webservers` group and records the action locally.

Example:

```bash
cd remediation
ansible-playbook patch_critical_cve.yml -i inventory.ini
```

## Notes

- Update `TARGET_SUBNET` in [discovery/asset_discovery.sh](discovery/asset_discovery.sh) before running discovery.
- Update the OpenSCAP datastream or profile in [compliance/oscap_cis_scan.sh](compliance/oscap_cis_scan.sh) if your target OS differs.
- The repository is best used as a lab or demo workflow, not a production hardening platform out of the box.

## Author

Sandeep Karmata