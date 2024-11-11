#!/usr/bin/env bash

marp \
  --allow-local-files \
  --theme ./themes/codetalks.css --theme-set ./themes/base.css \
  -o ./index.html \
  --no-confog-file true \
  --browser-timeout 300 \
  --debug true \
  --template bespoke \
  --bespoke.osc true \
  --bspoke.progress false \
  --watch \
  --html true \
  --bespoke.transition true \
  ./index.md

#  --no-confog-file true \
#  --allow-local-files true\
#  --browser-timeout 300 \
#  --title "" \
#  --description "" \
#  --author "Smirnov Viacheslav | QA Load" \
#  --keywords "JUnit, Allure TestOps, k6, Performance Tests" \
#  --url "https://github.com/polarnik/k6-junit-integration" \

