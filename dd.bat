@echo off
echo [DiscordDigital - GitHub]
if "%1"=="" goto syntax
if "%1"=="setup" goto install
if "%1"=="list" goto openlist
echo Loading your request..
curl -s https://github.com/DiscordDigital/%1 | findstr "404" 2> nul > nul
if "%errorlevel%"=="0" goto repoerror

for /f %%i in ('curl -s https://raw.githubusercontent.com/DiscordDigital/%1/master/.ddpm') do set target=%%i
echo %target% | findstr "404" > nul
if "%errorlevel%"=="0" goto compatibility
curl -s https://raw.githubusercontent.com/DiscordDigital/%1/master/%target% > %target%
echo [OK] Created %target% in %cd%

goto :eof

:openlist
echo [OK] Launched your browser
start https://github.com/DiscordDigital?tab=repositories
goto :eof

:install
openfiles>nul 2>&1
if "%errorlevel%"=="1" goto permission
if exist "%systemroot%\dd.bat" goto :uninstall
echo Installing %0 to "%systemroot%\dd.bat"
echo.
copy %~dp0%~nx0 "%systemroot%\dd.bat" > nul
set elevel=%errorlevel%
if "%elevel%"=="0" echo [OK] Installed, type "dd" to start.
if not "%elevel%"=="0" echo [ERROR] Something went wrong while installing
goto :eof

:uninstall
del /Q "%systemroot%\dd.bat" > nul
set elevel=%errorlevel%
if "%elevel%"=="0" echo [OK] Uninstalled.
if not "%elevel%"=="0" echo [ERROR] Can't remove "%systemroot%\dd.bat" for some reason.
goto :eof

:repoerror
echo [ERROR] Repository "DiscordDigital/%1" not found.
echo.
goto :eof

:permission
echo [ERROR] Please run the setup as administrator
goto :eof

:compatibility
echo [WARN]
echo The repository exists, but I can't use it.
echo.
echo Probably not compatible or implemented yet.
echo.
goto :eof

:syntax
echo [INFO]
echo Syntax: dd ^<package name^>
echo         dd list
echo.
goto :eof
