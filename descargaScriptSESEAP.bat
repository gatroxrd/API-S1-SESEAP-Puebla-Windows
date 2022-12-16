@ECHO OFF
wget -c -S -r https://raw.githubusercontent.com/gatroxrd/API-S1-SESEAP-Puebla-Windows/main/instalaSESEAP_S1_Windows.ps1

ECHO Invoke-WebRequest "https://raw.githubusercontent.com/gatroxrd/API-S1-SESEAP-Puebla-Windows/main/instalaSESEAP_S1_Windows.ps1" -OutFile "C:\Users\%USERNAME%\ai\exdown.exe">>"%PSScript%"

echo continuar ...

pause > nul