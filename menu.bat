@echo off

rem BEGIN ARGUMENT LOGIC
if /i "%1" == "" goto help
if /i "%1" == "-h" goto help
if /i "%1" == "--help" goto help

if /i "%1" == "-a" (
    if /i "%2" == "-d" goto alldebug
    if not "%2" == "-d" goto all
)

if /i "%1" == "-d" (
    if /i "%2" == "-a" goto alldebug
    if /i "%2" == "" goto debug
    if not "%2" == "" goto debugfile
)

if not "%1" == "" goto file
rem END ARGUMENT LOGIC

:file
    rem option: <filename>
    goto :eof

:all
    rem option: -a
    goto :eof

:alldebug
    rem option: -a -d
    goto :eof

:debugfile
    rem option: -d <filename>
    goto :eof

:debug
    rem option: -d
    goto :eof

:help
    rem option: -h, --help or no arguments
    echo do something with the provided ^<filepath^>, default option is -a.
    echo usage: menu [options] [^<filepath^>]
    echo.
    echo    -a            do something for all
    echo    -d            do something for debug
    echo    -h, --help    display the help
    goto :eof

@echo on
