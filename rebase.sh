#!/bin/bash -x
set -e # get out if error!

currentBranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
echo $currentBranch

git branch

if [ "$#" -gt 1 ] 
then
  echo "Wrong number of arguments. Should be none or 1 rebase branch  (if no args given and you uncomment rebaseBranch=, rebase branch defaults to origin/master for where you are rebasing from), was $#";
  echo "usage of 0 or 1 arguments:"
  echo ""
  echo "filename.sh"
  echo "filename.sh my-custom-rebase-branch"
  exit 1;
fi

rebaseBranch=$1

# default to origin if no rebase branch passed
if [ "$#" -lt 1 ]
then
#  rebaseBranch="origin/master"
exit 1;
fi

echo $rebaseBranch
rebaseBranchNoOrigin=${rebaseBranch//origin\/}

echo $rebaseBranchNoOrigin 

git checkout $rebaseBranchNoOrigin
git pull
git checkout $currentBranch

HASH="$(git merge-base $currentBranch $rebaseBranch)"
echo "${HASH}"
git rebase -i ${HASH} 
git rebase -i $rebaseBranch 
echo ""
git status -s
