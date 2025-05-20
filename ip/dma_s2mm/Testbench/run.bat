@echo off
SETLOCAL EnableDelayedExpansion

set "MyApp=dmasg.bin"
::set PATH=%PATH%;<<PATH_TO_MODELSIM>>

set stamp=SimSOC_%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set stamp=%stamp: =%
MD %stamp%

IF "%MyApp%"=="" (
echo "MyApp variable isn't set, running DMA TEST..."
echo "Copy your software bin file, eg.blinkAndEcho.bin to this directory"
echo "Set MyApp environment variable as your software bin file name"
) else (
echo "Converting %MyApp% to MEM.TXT"
certutil -f -encodehex %MyApp% hex_apps.txt 8

if exist MEM.TXT del MEM.TXT
for /f "tokens=*" %%a in (hex_apps.txt) do (
	set space=%%a
	echo !space: =! >> hex_apps_1.txt
)

if exist hex_apps_trim.txt del hex_apps_trim.txt
for /f "tokens=*" %%a in (hex_apps_1.txt) do (
	
	call :processLittleEndian %%a
)
type hex_dummy.txt hex_apps_trim.txt > MEM.TXT
del hex_apps_1.txt
del hex_apps.txt
del hex_apps_trim.txt
)

xcopy *.bin %stamp%
xcopy *.do %stamp%
xcopy *.v %stamp%
xcopy *.vh %stamp%
xcopy *.TXT %stamp%
cd %stamp%
vsim.exe -do sim.do

goto :eof

:processLittleEndian
setlocal EnableExtensions
set "BytesBE=%~1"
if not defined BytesBE goto :EOF

set "BytesCO=%BytesBE%"
set "BytesLE="

:ChangeOrder
set "BytesLE=%BytesLE%%BytesCO:~-2%"
set "BytesCO=%BytesCO:~0,-2%"
if defined BytesCO goto ChangeOrder

echo    Big Endian: %BytesBE%
echo %BytesLE% >> hex_apps_trim.txt

endlocal
goto :eof
