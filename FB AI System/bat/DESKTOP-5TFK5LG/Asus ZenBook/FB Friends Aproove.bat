@echo off
echo Starting task... (-names "FB Friends Aproove")
"C:\Program Files\ZennoLab\RU\ZennoPoster Pro V7\7.7.14.0\Progs\TasksRunner.exe" -o StartTask -names "FB Friends Aproove"
timeout /t 1
echo Set tries count to -1... (-names "FB Friends Aproove")
"C:\Program Files\ZennoLab\RU\ZennoPoster Pro V7\7.7.14.0\Progs\TasksRunner.exe" -o SetTries -1 -names "FB Friends Aproove"
timeout /t 1
echo Set threads count to 0... (-names "FB Friends Aproove")
"C:\Program Files\ZennoLab\RU\ZennoPoster Pro V7\7.7.14.0\Progs\TasksRunner.exe" -o SetThreads 0 -names "FB Friends Aproove"