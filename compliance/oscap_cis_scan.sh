#!/bin/bash
# VulnVision 360 - OpenSCAP Continuous Compliance Engine

# Define the target OS and CIS Profile
# Assuming Debian/Ubuntu for the target server based on earlier projects
DATASTREAM="/usr/share/xml/scap/ssg/content/ssg-debian11-ds.xml"
PROFILE="xccdf_org.ssgproject.content_profile_cis"
OUTPUT_DIR="../reports/compliance"

echo "Executing OpenSCAP CIS Level 1 Benchmark Scan..."
mkdir -p $OUTPUT_DIR

# Run the evaluation and generate an HTML report
oscap xccdf eval \
  --profile $PROFILE \
  --results $OUTPUT_DIR/oscap_results.xml \
  --report $OUTPUT_DIR/cis_compliance_report.html \
  $DATASTREAM

echo "Compliance scan finished. HTML report generated at $OUTPUT_DIR/cis_compliance_report.html"
echo "Please review report for SSH configuration failures (e.g., empty passwords allowed)."