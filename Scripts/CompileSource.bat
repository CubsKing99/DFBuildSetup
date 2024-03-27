@ECHO off
SET PATH=%DF24BIN%;%PATH%

@ECHO on

REM echo %PATH%

DFCOMPCONSOLE.exe %1.src -x %2 -e2fv2wCI2
IF %ERRORLEVEL% GEQ 1 exit /b %ERRORLEVEL%

@ECHO off
REM Apparently DFCOMP doesn't use a return code, so we'll also have to check if theres a .ERR file...
SET ERRORCOUNT=0
cd .\AppSrc
FOR %%A IN (*.err) do IF /i "%%A"=="%2.err" (
  set /a ERRORCOUNT+=1
  ECHO Errors in %2.err
  type %2.err
)

cd ..

@ECHO on
exit /b %ERRORCOUNT%
