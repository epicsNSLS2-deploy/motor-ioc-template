:: Batch file for cleaning up the IOC directory.

@echo off
cd /D "%~dp0"

rmdir /s /q dependancyFiles\
rmdir /s /q startupScripts\
rmdir /s /q logs\
rmdir /s /q .git\

mkdir as
cd as
mkdir req
mkdir save
cd ..
del README*
del .gitignore
del *OLD*
del cleanup.sh