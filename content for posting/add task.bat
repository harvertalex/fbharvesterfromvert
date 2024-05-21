@echo off
SETLOCAL

:: Получаем полный путь к директории, где расположен этот батник
set "script_dir=%~dp0"

:: Полный путь к скрипту, который нужно запустить через планировщик
set "full_script_path=%script_dir%makenewcontent.bat"

:: Проверка на административные привилегии и установка задачи в планировщик
schtasks /create /sc minute /mo 15 /tn "MediaFileProcessing" /tr "%full_script_path%" /ru "SYSTEM" /f

:: Очистка переменных
set "script_dir="
set "full_script_path="
