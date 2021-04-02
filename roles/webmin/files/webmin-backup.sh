#!/bin/bash
# Script to backup webmin DHCP and DNS configurations to git.

cd /webmin-backups
/usr/bin/git add .
/usr/bin/git commit -m "nightly backup: $(date)"
/usr/bin/git push -u origin main
