#!/usr/bin/env bash

set -e

if [[ -z "$TRAVIS" ]]; then
  read -rp "This operation will destroy locally modified files. Continue ? [N/y]: " answer
  if [[ ! $answer =~ [yY] ]]; then
    exit 2
  fi
fi

git tag __testing_point__
git checkout master || git checkout -b master
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard __testing_point__
git submodule update --init --recursive
