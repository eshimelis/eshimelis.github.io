#!/usr/bin/bash

# Run this script to deploy the app to Github Pages.

# Exit if any subcommand fails.
set -e

# Make sure there aren't any uncommited changes
if [[ $(git diff --name-only) ]]; then
    echo "There are uncommitted files. They will be erased if they are not commited and pushed."
    echo
    git diff --name-only
    echo
    read -p "Do you want to continue with deployment (y/N)? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        :
    else
        echo "Exiting..."
        exit 1
    fi
else
    echo "All files committed, continuing with deployment."
fi

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
