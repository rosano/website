#!/bin/sh

git pull --rebase --autostash
npm run build:dist
git checkout gh-pages
cp -r out/* .
git add --all
git commit -m "Update static build - `date -u`"
if [ $1 = "production" ]; then
  # For prod deploys you need to have the 5apps remote configured:
  # git remote add 5apps git@5apps.com:remotestorage_remotestorageio.git
  git push -f 5apps gh-pages:master
else
  git push origin gh-pages:gh-pages
fi
git checkout -
