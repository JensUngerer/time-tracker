REM https://stackoverflow.com/questions/10945572/windows-batch-formatted-date-into-variable
REM for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate set MyDate=%%x
REM set today=%MyDate:~0,4%-%MyDate:~4,2%-%MyDate:~6,2%
REM https://stackoverflow.com/questions/15378719/split-date-in-a-batch-file-regardless-of-regional-settings
@ECHO OFF
:: Check WMIC is available
WMIC.EXE Alias /? >NUL 2>&1 || GOTO s_error

:: Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
   IF "%%~L"=="" goto s_done
      Set _yyyy=%%L
      Set _mm=00%%J
      Set _dd=00%%G
      Set _hour=00%%H
      SET _minute=00%%I
)
:s_done

:: Pad digits with leading zeros
      Set _mm=%_mm:~-2%
      Set _dd=%_dd:~-2%
      Set _hour=%_hour:~-2%
      Set _minute=%_minute:~-2%

:: Display the date/time
Set _isodate=%_yyyy%-%_mm%-%_dd%_%_hour%-%_minute%
Echo %_isodate%
SET folderName=%_isodate%_MONGO_EXPORT
REM https://stackoverflow.com/questions/33492008/how-to-import-export-all-collections-of-the-mongodb-database-using-mongodb-java
echo %folderName%
REM https://techoverflow.net/2018/06/04/how-to-make-mongodump-export-json-instead-of-bson/

REM https://stackoverflow.com/questions/18462169/how-to-loop-through-array-in-batch
set Arr[0]=booking-declarations
set Arr[1]=projects
set Arr[2]=time-entries
set Arr[3]=tasks
set Arr[4]=book-time-records
set Arr[5]=commit-time-records

if not exist %folderName% (mkdir %folderName%)

set "x=0"
:SymLoop
if defined Arr[%x%] (
    @REM call echo %%Arr[%x%]%%
    SET collectionName=%%Arr[%x%]%%
    call echo %collectionName%
    call "mongoexport" --host localhost --port 27021 -c %collectionName% -d "timeTracker" -o %folderName%\%collectionName%.json
    set /a "x+=1"
    GOTO :SymLoop
)
GOTO:EOF
:s_error
Echo GetDate.cmd
Echo Displays date and time independent of OS Locale, Language or date format.
Echo Requires Windows XP Professional, Vista or Windows 7
Echo.
Echo Returns 6 environment variables containing isodate,Year,Month,Day,hour and minute.