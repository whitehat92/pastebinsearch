#!/bin/bash
# requires tojson and gron
#special thanks to tomnomnom for these tools. Without a single doubt, you're a machine. Thank you so much for the work you put everyday and for sharing it.

curl -is https://psbdmp.ws/api/search/$1 | tojson | sed 's/\"data\\\"\:/\n/g' | sed 's/\,{\\"id\\":/,\n{\"id\":/g' | tojson | gron | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" | awk -F '"' '{print $5}' | sed "s/;//g" | sed "s/\:\\\//g" | sed 's/\\//g' | sed 's/^[[:space:]]*//g' | xargs -I {} curl -is https://pastebin.com/{} | grep -v "has been removed"
