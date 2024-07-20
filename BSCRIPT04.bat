set src_dir=C:\*.txt
set archive_dir=Z:\ArchivedFiles

if not exist "%archive_dir%" mkdir "%archive_dir%"

echo Moving older text files from Drive C: to Drive Z:...
forfiles /p "C:\" /m *.txt /d -30 /c "cmd /c move @file %archive_dir%"

echo Listing archived files sorted by size...
dir "%archive_dir%" /a-d /o-s /b > sorted_files.txt

echo The following files are the largest in the archive:
type sorted_files.txt

set /p delete_confirm=Do you want to delete these files? (Y/N): 
if /I "!delete_confirm!"=="Y" (
    for /f "skip=5 delims=" %%F in (sorted_files.txt) do (
        del "%archive_dir%\%%F"
    )
    echo Old, large files deleted.
) else (
    echo Deletion cancelled.
)

del sorted_files.txt
pause
echo Operation Complete
exit