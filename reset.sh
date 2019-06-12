#!/bin/bash

echo "========npm install no ta-gui========"
cd gui/ta-gui/
rm -rf node_modules/
npm install
cd ../../

echo "========tsc no ta-server==========="
cd server/ta-server/
npm install @types/express
tsc
npm install
cd ../../

echo "=========tsc no app========="
cd gui/ta-gui/src/app/
tsc
cd ../../../../

echo "==========npm install no tests-acceptance=========="
cd tests-acceptance/
rm -rf node_modules/
npm install
cd ../

echo "======tsc no config.ts========"
cd tests-acceptance/config/
tsc
cd ../../

echo "===========webdriver update no tests-acceptance============"
cd tests-acceptance/
webdriver-manager update
echo "============tsc no tests-acceptance============"
tsc
cd ../

