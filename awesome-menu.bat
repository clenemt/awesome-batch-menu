@echo off

:reset
rem Reset variables from previous usage
    set user=
    set option=
    set verbose=
    set file=

:getopts
rem Will iterate over passed arguments
    if not [%1]==[] (
        set found=

        rem Some common opts example below

        if "%~1"=="-u" set res=1
        if "%~1"=="--user" set res=1
        if defined res (
            set user=%2 & set found=1 & set res=
            shift
        )

        if "%~1"=="-o" set res=1
        if "%~1"=="--option" set res=1
        if defined res (
            set option=%2 & set found=1 & set res=
            shift
        )

        if "%~1"=="-v" set res=1
        if "%~1"=="--verbose" set res=1
        if defined res (
            set verbose=1 & set found=1 & set res=
        )

        if "%~1"=="-h" set res=1
        if "%~1"=="--help" set res=1
        if defined res (
            goto :help
        )

        rem Put your other options below
        rem ...

        rem The mandatory opt (remove if you don't have one)
        if not defined found (
            set file=%1
        )

        shift
        goto :getopts
    )

:processopts
rem Your opt handling logic goes below

    rem Sample verbose handling
    if defined verbose (
        echo user = %user%
        echo option = %opion%
        echo verbose = %verbose%
        echo file = %file%
    )

    rem Sample file handling
    if not defined file (
        echo The ^<file^> argument is mandatory. See below.
        goto :help
    )
    goto :eof

:help
    echo.
    echo Do something with the provided ^<file^>.
    echo usage: awesome-menu [options] ^<file^>
    echo.
    echo    -u, --user       the username
    echo    -o, --option     some other option
    echo    -v, --verbose    run in verbose mode
    echo    -h, --help       display the help
