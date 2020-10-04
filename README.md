# Time-Tracker

## Cloning and checkout of sub-modules

```bat
set folderName=time-tracker
set gitCheckoutMaster=git checkout master
git clone --recurse-submodules --remote-submodules https://github.com/JensUngerer/time-tracker.git %folderName%
cd %folderName%
cd .\client
%gitCheckoutMaster%
cd ..
cd .\common
%gitCheckoutMaster%
cd ..
cd .\documentation
%gitCheckoutMaster%
cd ..
cd .\server
%gitCheckoutMaster%
```

## Create database collections (mongodb must be installed and running)

```bat
set folderName=time-tracker
cd %folderName%
cd database
createDatabase.bat
```

## Install dependencies

```bat
set folderName=time-tracker
set npmInstall=npm install
cd %folderName%
cd .\client
%npmInstall%
cd ..
cd .\serverNew
%npmInstall%
```

## Starting the Time-Tracker application

```console
start.bat
```
