#!/usr/bin/env bash

cd modules/nodebb/
git pull
git checkout v1.8.x
git fetch upstream
git rebase upstream/v1.8.x v1.8.x
cd -
