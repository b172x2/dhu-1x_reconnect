@echo off
echo WIFI自动重连服务正在进行中.......
echo 停止服务请按 Ctrl+C
:begin
echo %date% %time%
ping baidu.com
rem echo %errorlevel%
if %errorlevel%==1 goto ping2
goto loop
 
:ping2
ping 36.155.132.76
rem echo %errorlevel%
if %errorlevel%==1 goto reconnect
goto loop

:reconnect
echo %date% %time% 网络主动断开
netsh wlan disconnect
echo %date% %time% 正在重新连接中....
netsh wlan connect ssid=DHU-1X name=DHU-1X
echo %date% %time% 已发送连接请求....ssid=DHU-1X
goto loop
 
:loop
timeout 600
goto begin
