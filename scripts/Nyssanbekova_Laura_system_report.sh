#!/bin/bash
set -u

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOG_FILE="$PROJECT_DIR/logs/Nyssanbekova_Laura_system_report.log"
STUDENT_NAME="Laura Nyssanbekova"

mkdir -p "$PROJECT_DIR/logs"
{
    echo "========================================"
    echo "Student: $STUDENT_NAME"
    echo "Date and time: $(date '+%Y-%m-%d %H:%M:%S %Z')"
    echo "Current username: $(whoami)"
    echo "Operating system:"
    if [ -r /etc/os-release ]; then
        . /etc/os-release
        echo "${PRETTY_NAME:-Unknown Linux}"
    else
        uname -s
    fi
    echo "Kernel: $(uname -r)"
    echo
    echo "CPU information:"
    if command -v lscpu >/dev/null 2>&1; then lscpu | head -n 12; else uname -p; fi
    echo
    echo "Memory:"
    free -h 2>&1 || true
    echo
    echo "Disk usage:"
    df -h
    echo
    echo "Available disk space (root filesystem):"
    df -h / | awk 'NR==1 || NR==2 {print}'
    echo "========================================"
} | tee -a "$LOG_FILE"
