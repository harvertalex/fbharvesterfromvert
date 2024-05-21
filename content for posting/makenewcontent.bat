@echo off
SETLOCAL EnableDelayedExpansion

:: Подсчет файлов видео и изображений
set video_count=0
set img_count=0
for /F %%x in ('dir /B "video\out\*.mp4" ^| find /v /c ""') do set video_count=%%x
for /F %%x in ('dir /B "img\out\*.jpg" ^| find /v /c ""') do set img_count=%%x

:: Если файлов видео или изображений достаточно, завершаем работу
if %video_count% geq 10 (
    echo There are already 10 or more video files in the video out directory.
    goto end
)
if %img_count% geq 10 (
    echo There are already 10 or more image files in the image out directory.
    goto end
)

:: Определение переменных для расширений файлов и качества изображений
set video_ext=mp4
set img_ext=jpg
set img_ext2=png
set img_quality=95

:: Обработка видеофайлов
FOR /F "tokens=*" %%G IN ('dir /b "content for posting\video\*.mp4"') DO (
    set retry_count=0
    :retry_video
    set /a number1=!random! %% 7
    set output_file="content for posting\video\out\%%~nG_!RANDOM!.%video_ext%"
    ffmpeg -i "%%G" -vf "noise=alls=!number1!:allf=t" "!output_file!" >nul 2>&1 && (
        echo File "!output_file!" processed successfully.
    ) || (
        if !retry_count! lss 5 (
            set /a retry_count+=1
            echo Error processing file "%%G", retry attempt !retry_count!
            timeout /t 3 /nobreak >nul
            goto retry_video
        ) else (
            echo Failed after multiple attempts, moving to next file...
        )
    )
)

:: Обработка изображений
FOR %%I IN ("content for posting\img\*.jpg", "content for posting\img\*.png") DO (
    set output_img="content for posting\img\out\%%~nI_!RANDOM!.%%~xI"
    ffmpeg -i "%%I" -vf "eq=contrast=1.5:brightness=0.1" "!output_img!" >nul 2>&1 && (
        echo Image "!output_img!" processed successfully.
    ) || (
        echo Error processing image "%%I"
    )
)

:end
