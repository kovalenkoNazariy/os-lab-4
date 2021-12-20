@ECHO OFF

echo.
echo Kovalenko Nazariy
echo LABA  4
echo GROUP 6
echo TASK  8
echo.

if "%1"=="help" (goto help)
if "%1"=="" (goto error)
if "%2"=="" (goto error)

rem fp = first parameter
set this=%0%
set fp=%1%

if exist %1 (goto skipFolderCreate)
echo folder named %1 doesnt exist, creating a new one...
mkdir %1

:skipFolderCreate
shift

:loopThroughArguments
if [%1%]==[] (goto breakLoop)

if exist %fp%\.%1 (goto skipInternalFolderCreate)
mkdir %fp%\.%1

:skipInternalFolderCreate

shift 
goto loopThroughArguments 

:breakLoop

for /r %%A in (*) do (
	if not [%%~nxA]==[%this%] (
		if exist %fp%\%%~xA (copy "%%A" "%fp%\%%~xA" > nul) else (copy "%%A" "%fp%" > nul)
	)
)

goto end

:error
echo Wrong arguments.
:help
echo Usage: test.bat [folderName] [txt] [png] ...

:end