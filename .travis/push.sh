#!/bin/sh

setup_git() {
  git config --global user.email "fannyvignolles@gmail.com"
  git config --global user.name "fvgls"
}

commit_website_files() {
  git checkout master
  git add . 
  git commit --message "Generating docs / Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://${GITHUB_TOKEN}@github.com/fvgls/mkdocs.git > /dev/null 2>&1
  git push --quiet --set-upstream origin-pages docs 
}

setup_git
commit_website_files
upload_files
