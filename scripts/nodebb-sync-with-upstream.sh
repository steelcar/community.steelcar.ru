#!/usr/bin/env bash

cd modules/nodebb/
git pull
git checkout v1.8.x
git fetch upstream
#git rebase upstream/v1.8.x v1.8.x
git merge upstream/master
cd -


git checkout upstream-v1.8.x
git pull
git push origin upstream-v1.8.x
