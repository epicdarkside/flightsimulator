::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBhcWRSLA2CwH4k45//14+WGpl4hXe8+f4rIl6aLLe8F70fjOIY/02xTndxCBRhXHg==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBhcWRSLA2CwH4kz5u3f/eORp3GtlFLvyF5rBAVpkDijMwVVlCfPZqTqQ/cvBBpMWSKfUgM1vGBBvmGXecKEtm8=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal EnableDelayedExpansion

REM Define the flight area
set "Width=50"
set "Height=15"

REM Initial position and speed of the plane
set "PlaneX=5"
set "PlaneY=%Height%"
set "Altitude=10"
set "PlaneSpeedX=1"
set "PlaneSpeedY=1"
set "ClimbRate=1"

REM Initialize game loop
:GameLoop
cls

REM Draw the flight area
for /L %%i in (1,1,%Height%) do (
  for /L %%j in (1,1,%Width%) do (
    if %%i==%PlaneY% if %%j==%PlaneX% (
      echo ^
    ) else (
      echo .
    )
  )
)

REM Display altitude and control instructions
echo Altitude: %Altitude%
echo.
echo Control Instructions:
echo W - Climb
echo S - Descend
echo A - Turn Left
echo D - Turn Right
echo Q - Quit
echo.

REM Get user input
set /p "Input=Enter your command: "

REM Process user input
if /i "%Input%"=="W" set /a "Altitude+=ClimbRate"
if /i "%Input%"=="S" set /a "Altitude-=ClimbRate"
if /i "%Input%"=="A" set /a "PlaneX-=PlaneSpeedX"
if /i "%Input%"=="D" set /a "PlaneX+=PlaneSpeedX"
if /i "%Input%"=="Q" (
  echo Thanks for flying with us! Safe landing!
  pause
  exit /b
)

REM Update plane position
set /a "PlaneY-=%Altitude%"

REM Check for collision with the ground
if %PlaneY% gtr %Height% (
  set "PlaneY=%Height%"
  set "Altitude=0"
)

REM Delay for a short time before the next iteration
ping -n 1 localhost >nul

REM Continue the game loop
goto GameLoop
