REM Skript wurde von sm (EITI AG) erstellt 13.09.2022

@echo off
echo In einer Minute werden die innosolv Dienste geprueft und gestartet falls noetig.
timeout /t 60
for /F "tokens=3 delims=: " %%H in ('sc query "innoadressintegration" ^| findstr "STATE"') do (
  if /I "%%H" NEQ "RUNNING" (
   net start innoadressintegration
  ) 
)

for /F "tokens=3 delims=: " %%H in ('sc query "innoappserver" ^| findstr "STATE"') do (
  if /I "%%H" NEQ "RUNNING" (
   net start innoappserver
  ) 
)

for /F "tokens=3 delims=: " %%H in ('sc query "innopluginservice" ^| findstr "STATE"') do (
  if /I "%%H" NEQ "RUNNING" (
   net start innopluginservice
  ) 
)

for /F "tokens=3 delims=: " %%H in ('sc query "innowebservice" ^| findstr "STATE"') do (
  if /I "%%H" NEQ "RUNNING" (
   net start innowebservice
  ) 
)
