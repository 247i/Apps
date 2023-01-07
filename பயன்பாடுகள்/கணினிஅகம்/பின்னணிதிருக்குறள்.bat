@echo on
cd /d %~dp0

rem Set ldt=20200204222340.360000+330 - Below code will get date and time in this format.
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j

rem extract the content form the file.
Set /a Year=%ldt:~0,4%, Month=1%ldt:~4,2% %% 100, Day=1%ldt:~6,2% %% 100,Hour=%ldt:~8,2%, Minute=%ldt:~10,2%, Seconds=1%ldt:~12,2% %% 100

rem compute leap year
Set /a YMod4=%Year% %% 4, LYear = 0
if %YMod4% equ 0 set /a LYear = 1

rem Define accumulated days of the year for various months
Set /a acm[1]=0, acm[2]=31, acm[3]=59, acm[4]=90, acm[5]=120, acm[6]=151, acm[7]=181, acm[8]=212, acm[9]=243, acm[10]=273, acm[11]=304, acm[12]=334

rem To Access array indexed variable extensions are enabled 
setlocal EnableExtensions EnableDelayedExpansion

rem compute day of the year
set /a DoY= !acm[%Month%]! + %Day%
if %Month% gtr 2 set /A DoY+=%LYear%

Rem Extensionts are disabled and variable value is takenout 
endlocal & Set "Doy=%DoY%"

Rem convert to Thiruvalluvar day of year and year.
Set /a TrYear = %Year%+31, TrDay = %DoY% - 14
if %LYear% equ 1 set /A Trday = %TrDay% - 1
if %Month% equ 1 if %TrDay% lss 1 ( set /A TrYear = %TrYear% - 1, TrDay = %TrDay% + 365 + %LYear%)
Rem Thiruvalluvar Day conversion over 

Set /a TYMod4=%TrYear% %% 4
set /a DoTLY = %TrDaY% + %TYMod4%*365
Set /a Kod= (%DoTLY% %% 1330)+1
Set Kod1=000%Kod%
Set Kod2=%Kod1:~-4%
start /min பின்னணிதகவல்.exe திருக்குறள்\திருக்குறள்-%Kod2%.bgi /NOLICPROMPT /SILENT /timer:0
echo திருவள்ளுவர் ஆண்டு  %TrYear% நாள் %TrDay% 
Rem move to portableApps 
cd ..\..
Rem Map PortableApps as T Drive
Rem subst T: %cd%
goto :eof