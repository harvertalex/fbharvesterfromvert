@echo off
echo Starting task... (-names "FB Inviter")
"C:\Program Files\ZennoLab\RU\ZennoPoster Pro V7\7.7.14.0\Progs\TasksRunner.exe" -o StartTask -names "FB Inviter"
timeout /t 1
echo Set tries count to -1... (-names "FB Inviter")
"C:\Program Files\ZennoLab\RU\ZennoPoster Pro V7\7.7.14.0\Progs\TasksRunner.exe" -o SetTries -1 -names "FB Inviter"
timeout /t 1
echo Set threads count to 2... (-names "FB Inviter")
"C:\Program Files\ZennoLab\RU\ZennoPoster Pro V7\7.7.14.0\Progs\TasksRunner.exe" -o SetThreads 2 -names "FB Inviter"