#!/usr/bin/env bash

set -e

name=${PWD##*/}

rm -rf .git/

for f in template.cabal README.md Dockerfile; do
  perl -i -pe "s/template/$name/g" "$f"
done

mv template.cabal "$name.cabal"
rm -f init.sh

git add .
git commit -m "Initial import from template."
