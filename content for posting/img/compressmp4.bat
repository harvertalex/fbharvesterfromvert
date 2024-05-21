@echo off
SETLOCAL EnableDelayedExpansion

set deleteOriginal=y
set /p crf=Enter the CRF value (30 is the default):

if "%crf%"=="" (
    set crf=30
)

if "%1"=="" (
    FOR /F "tokens=*" %%G IN ('dir /b /S *.mp4') DO (
        for %%H in ("%%G") do (
            set "fileSize=%%~zH"
            if !fileSize! GTR 5000000 (
                ffmpeg -i "%%G" -vcodec libx264 -crf !crf! -acodec aac "%%~nG_new.mp4"
                if /i "%deleteOriginal%"=="y" (
                    del "%%G"
                    ren "%%~nG_new.mp4" "%%~nxG"
                )
            ) else (
                echo Skipping "%%~nG" due to small file size.
            )
        )
    )
) else (
    for %%H in ("%1") do (
        set "fileSize=%%~zH"
        if !fileSize! GTR 5000000 (
            ffmpeg -i "%1" -vcodec libx264 -crf !crf! -acodec aac "%~n1_new.mp4"
            if /i "%deleteOriginal%"=="y" (
                del "%1"
                ren "%~n1_new.mp4" "%~nx1"
            )
        ) else (
            echo Skipping "%~n1" due to small file size.
        )
    )
)
