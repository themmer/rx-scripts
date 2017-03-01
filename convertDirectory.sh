#! /bin/bash

if [ "$#" -eq 0 ]
then

 find client -type f -name "*.js" | while read LINE
 do
  echo "CONVERTING test of $LINE"
  lebab $LINE -o $LINE
 done

fi
