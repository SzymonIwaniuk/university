#!/bin/sh

for id in $(ipcs -q | awk 'NR>3 {print $2}'); do ipcrm -q "$id" 2>/dev/null; done
for id in $(ipcs -m | awk 'NR>3 {print $2}'); do ipcrm -m "$id" 2>/dev/null; done
for id in $(ipcs -s | awk 'NR>3 {print $2}'); do ipcrm -s "$id" 2>/dev/null; done
