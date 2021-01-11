#!/bin/bash

git add .
echo 'mess'
read mess
git commit -m mess
git push -u origin master << EOF
humancloud lu.linux3038
EOF
