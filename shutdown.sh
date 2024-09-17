#!/bin/bash
#set -x
ls -latr | grep drw | cut -d":" -f2 | cut -d" " -f2 > /tmp/foo-shutdown-list.txt

# Read from the file
while IFS= read -r line; do
  echo "$line"
  cd $line && pwd
  terraform destroy --auto-approve
  cd ..
done < /tmp/foo-shutdown-list.txt