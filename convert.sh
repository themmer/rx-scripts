#! /bin/bash

# Here is an example of what lebab does
# npm install -g lebab
# lebab SecuritySettingsView.spec.js -o SecuritySettingsView.spec.js

# npm install -g lebab 
# vim ~/convert.sh
# (Press I for insert mode then paste bash script)
# :wq
# chmod u+x convert.sh

# Usage: 

# convert.sh
# convert.sh a5102d1
# convert.sh a5102d1 9d4ba07
# (Review changes)

# should consider using this at some point
# git stripspace < `filename` 

function convert() {
 
 FILENAME=$@
 echo " CONVERTING es6 of $FILENAME"
 if [ ! $FILENAME = "" ] 
 then
  lebab $FILENAME -o $FILENAME --transform multi-var
  lebab $FILENAME -o $FILENAME --transform arrow
  lebab $FILENAME -o $FILENAME --transform let 
  lebab $FILENAME -o $FILENAME --transform arg-spread
  lebab $FILENAME -o $FILENAME --transform no-strict
  lebab $FILENAME -o $FILENAME --transform template
  lebab $FILENAME -o $FILENAME --transform default-param
 else
  echo "Line was blank. Double check what happened"
 fi
}

if [ "$#" -gt 2 ]
then
  echo "usage of 0 - means use local changes, 1 of one commit, or 2 representing start and end of hash commits"
  echo "filename.sh"
  echo "filename.sh 12345"
  echo "filename.sh 12345 12346"
  exit 1;
fi

if [ "$#" -eq 0 ]
then

 echo "Converting local changes only"
 git status --porcelain | sed s/^...// | grep ^.*\\/.*\\.js$ | while read LINE
 do
  echo $LINE
  convert $LINE 
 done

elif [ "$#" -eq 1 ]
then

 echo "Single commit" 
 git diff-tree --no-commit-id --name-only -r $1 | grep ^.*\\/.*\\.js$ | while read LINE
 do
  convert $LINE
 done 

elif [ "$#" -eq 2 ]
then

 echo "Range Commit"
 git diff --name-only $1..$2 | grep ^.*\\/.*\\.js$ | while read LINE
 do
  convert $LINE
 done

fi

