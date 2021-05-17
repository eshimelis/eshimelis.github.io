#!/usr/bin/bash

# Run this script to deploy the app to Github Pages.

# Exit if any subcommand fails.
set -e

echo "Started deploying"

# Checkout gh-pages branch.
if [ `git branch | grep gh-pages` ]
then
  git branch -D gh-pages
fi
git checkout -b gh-pages

# Build site.
sudo yarn install --modules-folder ./_assets/yarn
sudo bundle exec jekyll build

# Delete and move files.
sudo find . -maxdepth 1 ! -name '_site' ! -name '.git' ! -name '.gitignore' -exec rm -rf {} \;
sudo mv _site/* .
sudo rm -R _site/

# Push to gh-pages.
git add -fA
git commit --allow-empty -m "$(git log -1 --pretty=%B) [ci skip]"
git push -f -q origin gh-pages

# Move back to previous branch.
git checkout -
sudo yarn install --modules-folder ./_assets/yarn

echo "Deployed Successfully!"