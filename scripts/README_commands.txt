Additional Part 1 commands (run from the project root):

# Show structure
find . -maxdepth 3 -print | sort

# Confirm required files exist
test -f scripts/Nyssanbekova_Laura_system_report.sh && echo "Script exists"
test -f logs/Nyssanbekova_Laura_system_report.log && echo "Log exists"

# Run and inspect report
./scripts/Nyssanbekova_Laura_system_report.sh
tail -n 5 logs/Nyssanbekova_Laura_system_report.log
grep -i "Nyssanbekova" logs/Nyssanbekova_Laura_system_report.log > Nyssanbekova_Laura_log_analysis.txt
cat Nyssanbekova_Laura_log_analysis.txt

# Show a Java-related process if any exists
ps aux | grep -i '[j]ava' || echo "No Java process currently running"

# Create named README backup and verify contents
cp README.md backups/README_Nyssanbekova_Laura_backup.md
cmp README.md backups/README_Nyssanbekova_Laura_backup.md && echo "Backup contents match"
ls -l scripts/Nyssanbekova_Laura_system_report.sh logs/Nyssanbekova_Laura_system_report.log backups/README_Nyssanbekova_Laura_backup.md

# Required permissions: owner rwx, group r--, others r--
chmod 744 scripts/Nyssanbekova_Laura_system_report.sh
