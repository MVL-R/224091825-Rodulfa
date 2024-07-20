:menu
cls
echo ===========================================
echo     Windows Utilities Batch Script
echo ===========================================
echo.
echo Please select an option:
echo 1. ipconfig
echo 2. tasklist / taskkill
echo 3. chkdsk
echo 4. format
echo 5. defrag
echo 6. find
echo 7. attrib
echo 8. Exit
echo.
set /p choice=Enter your choice (1-8): 

if '%choice%'=='1' goto ipconfig
if '%choice%'=='2' goto task
if '%choice%'=='3' goto chkdsk
if '%choice%'=='4' goto format
if '%choice%'=='5' goto defrag
if '%choice%'=='6' goto find
if '%choice%'=='7' goto attrib
if '%choice%'=='8' goto end
echo Invalid choice, please select a number from 1 to 8.
pause
goto menu

:ipconfig
cls
echo ===========================================
echo            ipconfig Utility
echo ===========================================
ipconfig /all
pause
goto menu

:task
cls
echo ===========================================
echo         Tasklist / Taskkill Utility
echo ===========================================
echo.
echo Please select an option:
echo 1. View running tasks (tasklist)
echo 2. Kill a task by PID (taskkill)
echo 3. Return to main menu
echo.
set /p taskchoice=Enter your choice (1-3): 
if '%taskchoice%'=='1' tasklist & pause & goto task
if '%taskchoice%'=='2' (
    set /p pid=Enter the PID of the task to kill: 
    taskkill /PID %pid%
    if errorlevel 1 echo Failed to kill task. Please check the PID and try again.
    pause
    goto task
)
if '%taskchoice%'=='3' goto menu
echo Invalid choice, please select a number from 1 to 3.
pause
goto task

:chkdsk
cls
echo ===========================================
echo              chkdsk Utility
echo ===========================================
set /p drive=Enter the drive letter (e.g., C:): 
chkdsk %drive%
pause
goto menu

:format
cls
echo ===========================================
echo              format Utility
echo ===========================================
set /p drive=Enter the drive letter to format (e.g., D:): 
echo WARNING: Formatting will erase all data on the drive %drive%
set /p confirm=Are you sure you want to format %drive%? (Y/N): 
if /I '%confirm%'=='Y' (
    format %drive%
) else (
    echo Format cancelled.
)
pause
goto menu

:defrag
cls
echo ===========================================
echo              defrag Utility
echo ===========================================
set /p drive=Enter the drive letter to defrag (e.g., C:): 
defrag %drive%
pause
goto menu

:find
cls
echo ===========================================
echo               find Utility
echo ===========================================
set /p searchstring=Enter the string to search for: 
set /p filename=Enter the filename to search in: 
find "%searchstring%" %filename%
if errorlevel 1 echo String not found.
pause
goto menu

:attrib
cls
echo ===========================================
echo              attrib Utility
echo ===========================================
set /p filename=Enter the filename to view/change attributes: 
attrib %filename%
echo.
echo Please select an option:
echo 1. Add Read-only attribute
echo 2. Remove Read-only attribute
echo 3. Add Hidden attribute
echo 4. Remove Hidden attribute
echo 5. Return to main menu
echo.
set /p attribchoice=Enter your choice (1-5): 
if '%attribchoice%'=='1' attrib +r %filename%
if '%attribchoice%'=='2' attrib -r %filename%
if '%attribchoice%'=='3' attrib +h %filename%
if '%attribchoice%'=='4' attrib -h %filename%
if '%attribchoice%'=='5' goto menu
echo Invalid choice, please select a number from 1 to 5.
pause
goto attrib

:end
echo Shutting down program...
pause
shutdown