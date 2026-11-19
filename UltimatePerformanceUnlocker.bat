@echo off
setlocal enabledelayedexpansion

echo Unlocking Ultimate Performance Power Plan...

:: 1. Copy (unlock) the plan and capture the output
for /f "tokens=*" %%a in ('powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61') do (
    set "output=%%a"
)

:: 2. Extract the GUID from the output (4th token)
for /f "tokens=4" %%b in ("!output!") do (
    set "NEW_GUID=%%b"
)

:: 3. Activate the newly generated GUID
if defined NEW_GUID (
    echo Activating new plan GUID: !NEW_GUID!
    powercfg -setactive !NEW_GUID!
    echo Done.
) else (
    echo Failed to capture GUID. The plan might already exist or command failed.
)

pause