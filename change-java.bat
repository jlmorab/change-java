@echo off
setlocal EnableDelayedExpansion

REM --------------------------------------------------------
REM Script to change the version of Java on the system
REM Autor: José Luis Mora (@jlmorab)
REM Fecha: Mar, 2024
REM Version: 1.0.0
REM Licencia: MIT (https://opensource.org/licenses/MIT)
REM --------------------------------------------------------

if "%~1"=="" (
    echo %0 arg missing, java version path to be changed required
    exit /b 1
)

set "CURRENT_JAVA=%JAVA_HOME%\bin"
set "JAVA_HOME=%~1"
set "NEW_PATH=%JAVA_HOME%\bin"

for %%i in ("%PATH:;=" "%") do (
    if "%%~i" neq "" (
        if "%%~i" neq "%CURRENT_JAVA%" (
            set "NEW_PATH=!NEW_PATH!;%%~i"
        )
    )
)

set "PATH=%NEW_PATH%"

java -versions

endlocal & (
    set "JAVA_HOME=%JAVA_HOME%"
    set "PATH=%NEW_PATH%"
)