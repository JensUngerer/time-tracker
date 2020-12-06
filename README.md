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
cd .\serverNew
%gitCheckoutMaster%
```

## MongoDB setup

Install [MongoDB](https://www.mongodb.com/try/download/community).

If you installed it as ``Windows-Service``,
adjust the ``mongod.cfg``, so that it runs on port ``27021``:

```config
# network interfaces
net:
  port: 27021
  bindIp: 127.0.0.1
```

Per default, the ``.cfg`` file can be found in ``C:\Program Files\mongodb\Server\4.4\bin``.
In order to see this change in the ``mongod.cfg``, please restart the Service.
This can be done via ``services.msc``, or via ``reboot`` of ``Windows``.

## Create database collections (Mongodb must be installed and running)

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
