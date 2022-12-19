@ECHO OFF
@ECHO Descargando script de instalación de la API de la Secretaría Ejecutiva del Sistema Estatal Anticorrupión Puebla
Invoke-WebRequest "https://raw.githubusercontent.com/gatroxrd/API-S1-SESEAP-Puebla-Windows/main/instalaSESEAP_S1_Windows.ps1" -OutFile "%userprofile%\Desktop\instalaSESEAP_S1_Windows.ps1"
echo continuar ...
pause > nul