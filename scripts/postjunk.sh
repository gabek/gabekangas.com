#!/bin/bash

did_stash=false
DATE=`date +%Y-%m-%d`

if [ -z "$(git status --untracked-files=no --porcelain)" ]; then 
  # Working directory clean excluding untracked files
  echo "ok"
else 
  # Uncommitted changes in tracked files
  did_stash=true
  git stash >> /dev/null
fi

echo -n "Enter junk item title and hit [ENTER]: "
read title
filenameinput=`echo ${title// /_}`
filename="content/junk/$DATE-$filenameinput.md"

awk "NR==2{print \"title: \'$title\'\"}7" archetypes/junk.md | awk "NR==3{print \"date: \'$DATE\'\"}7" > $filename
code --wait $filename
git add $filename
git commit $filename -m "Added junk feed item: $title"
git push

# Restore the working directory
if [ "$did_stash" = true ] ; then
    git stash pop >> /dev/null
fi
