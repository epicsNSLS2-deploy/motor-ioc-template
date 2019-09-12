#!/bin/bash

#
# Script that cleans up IOC directory after motor-ioc-template has been cloned
#
# Author: Jakub Wlodek
#

# Make sure we are in the correct dir
cd "${0%/*}"

# Remove erroneous files/dirs
rm -rf dependancyFiles/
rm -rf startupScripts/
rm -rf logs/
rm -rf .git
rm .gitignore
rm README.md
mkdir as
mkdir as/req
mkdir as/save
rm *OLD*
rm cleanup.bat