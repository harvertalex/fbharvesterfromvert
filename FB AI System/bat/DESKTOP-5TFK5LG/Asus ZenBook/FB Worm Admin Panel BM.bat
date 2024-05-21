@echo off
echo Starting task... (-names "FB Worm Admin Panel BM")
"C:\Program Files\ZennoLab\RU\ZennoPoster Pro V7\7.7.14.0\Progs\TasksRunner.exe" -o StartTask -names "FB Worm Admin Panel BM"
timeout /t 1
echo Set tries count to -1... (-names "FB Worm Admin Panel BM")
"C:\Program Files\ZennoLab\RU\ZennoPoster Pro V7\7.7.14.0\Progs\TasksRunner.exe" -o SetTries -1 -names "FB Worm Admin Panel BM"
timeout /t 1
echo Set threads count to 0... (-names "FB Worm Admin Panel BM")
"C:\Program Files\ZennoLab\RU\ZennoPoster Pro V7\7.7.14.0\Progs\TasksRunner.exe" -o SetThreads 0 -names "FB Worm Admin Panel BM"