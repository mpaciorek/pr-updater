#!/bin/bash

git fetch upstream
git fetch $1
git checkout -b $2
git merge upstream/$3
git merge $1/$2
composer install
php app/console assetic:dump --env=prod
php app/console doctrine:schema:update --force
rm -R --force app/cache/*
