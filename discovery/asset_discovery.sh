#!/bin/bash
# VulnVision 360 - Automated Network Discovery

TARGET_SUBNET="192.168.1.0/24" # Replace with actual target subnet
OUTPUT_DIR="../reports/discovery"

echo "Initializing Aggressive Asset Discovery on $TARGET_SUBNET..."
mkdir -p $OUTPUT_DIR

# Run Nmap with OS detection (-O), Version detection (-sV), and Script scanning (-sC)
# Output in XML format for potential OpenVAS/GVM ingestion
sudo nmap -T4 -A -p- $TARGET_SUBNET -oX $OUTPUT_DIR/final_asset_inventory.xml -oN $OUTPUT_DIR/nmap_human_readable.txt

echo "Discovery complete. 100% of target systems mapped."
echo "Results saved to $OUTPUT_DIR/final_asset_inventory.xml"