#!/bin/bash

echo "git add ."
git add .

echo "git commit"
echo "input commit"
comment="commit new code"
read comment
git commit -m "$comment"


echo "git push origin main"
git push origin main

#git log --oneline --graph
#git log --oneline --graph -5
git log --pretty=format:"%h - %an, %ar : %s" -5
