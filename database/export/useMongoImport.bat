set dbName="timeTracker"
set basePath=2020-12-06_01-46_MONGO_EXPORT
REM https://stackoverflow.com/questions/18462169/how-to-loop-through-array-in-batch
set Arr[0]=booking-declarations
set Arr[1]=projects
set Arr[2]=time-entries
set Arr[3]=tasks
set Arr[4]=book-time-records
set Arr[5]=commit-time-records

set "x=0"
:SymLoop
if defined Arr[%x%] (
    @REM call echo %%Arr[%x%]%%
    SET collectionName=%%Arr[%x%]%%
    call echo %collectionName%
    call "mongoimport" --host localhost --port 27021 --db %dbName% --collection %collectionName% --file %basePath%\%collectionName%.json
    set /a "x+=1"
    GOTO :SymLoop
)
GOTO:EOF

