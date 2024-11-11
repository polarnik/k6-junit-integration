#!/usr/bin/env bash

marp \
  --allow-local-files \
  --theme ./themes/codetalks.css \
  -o ./index.pdf \
  --no-confog-file true \
  --browser-timeout 300 \
  --debug true \
  --jpeg-quality 100 \
  --image-scale 2 \
  --pdf-notes \
  --pdf-outlines \
  --pdf-outlines.pages \
  --pdf-outlines.headings \
  --html true \
  --watch \
  --browser "chrome" \
  --browser-protocol "webdriver-bidi" \
  ./index.md

#  --no-confog-file true \
#  --allow-local-files true\
#  --browser-timeout 300 \
#  --title "" \
#  --description "" \
#  --author "Smirnov Viacheslav | QA Load" \
#  --keywords "JUnit, Allure TestOps, k6, Performance Tests" \
#  --url "https://github.com/polarnik/k6-junit-integration" \

