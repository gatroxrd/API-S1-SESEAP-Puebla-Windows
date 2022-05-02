#!/bin/bash
#Agregando capacidades de despliegue de ventanas de dialogo
Add-Type -AssemblyName "System.Windows.Forms"
Set-ExecutionPolicy unrestricted
Clear-Host
Set-Location C:\DeclaracionesPDN

Write-Host "+ + + + + + + + + + + API S1 Conexion Entes - SESEAP - PDN + + + + + + + + + + + + + + + + + + +" -ForegroundColor Green -NoNewline; 
Write-Output "Script de descarga,instalacion y montado en el contenedor Docker de la API SESEAP S1"
Write-Output ""
Write-Output "Secretaria Ejecutiva del Sistema Estatal Anticorrupcion de Puebla (SESEAP)"
Write-Output "Unidad de Servicios Tecnologicos y Plataforma Digital (USTPD)"
Write-Output "                                                                            Version Windows al 22 de abril de 2022"
Write-Output "+ + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + "

[void][System.Windows.Forms.Messagebox]::Show("Script de descarga,instalacion y montado en el contenedor Docker de la API SESEAP S1","Secretaria Ejecutiva del Sistema Estatal Anticorrupcion de Puebla (SESEAP)")

	#sudo apt install zip unzip
	#set -a
	#source <(cat parametrosConfiguracion.txt|\
	#	sed -e '/^#/d;/^\s*$/d' -e "s/'/'\\\''/g" -e "s/=\(.*\)/='\1'/g")
	#set +a

    [System.Windows.MessageBox]::Show($popup_output)
	Write-Output "Iniciando descarga del proyecto .NET del repositorio GitHub de USTPD-SESEAP"
    Write-Output "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"
    #    sudo rm -rf API.S1.SESEAP
    try
    {
        Remove-Item -Recurse -Force c:\DeclaracionesPDN\API.S1.SESEAP
    }
    catch
    {}
	#mkdir API.S1.SESEAP
	New-Item -Path "c:\DeclaracionesPDN" -Name "API.S1.SESEAP" -ItemType "directory"
	Set-Location c:\DeclaracionesPDN\API.S1.SESEAP
	Invoke-WebRequest -Uri https://github.com/gatroxrd/API-S1-SESEAP-Puebla/raw/main/PDEPuebla.S1.PDN.zip -OutFile PDEPuebla.S1.PDN.zip
	Write-Output "Descomprimiendo archivos descargados"
    Write-Output "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"
	
	Expand-Archive -LiteralPath 'c:\DeclaracionesPDN\API.S1.SESEAP\PDEPuebla.S1.PDN.zip' -DestinationPath 'C:\DeclaracionesPDN\API.S1.SESEAP'
	Write-Output "Eliminando archivo .zip"
	#rm  PDEPuebla.S1.PDN.zip
    Remove-Item -Recurse -Force C:\DeclaracionesPDN\API.S1.SESEAP\PDEPuebla.S1.PDN.zip
    Write-Output "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"

    Write-Output "Cargando y procesando el archivo con los parametros de Configuracion"

    #Obteniendo valores del archivo de parametros de configuraciÃ³n

    $content = Get-Content -Path 'c:\DeclaracionesPDN\parametrosConfiguracion.txt';
    
    $temporal = $content | Where-Object {$_ -like "apiName=*" }
    $apiname = $temporal -replace 'apiName=',''
  	#sed -i "s/valorW/$apiname/g" appsettings.json
    (Get-Content -path C:\DeclaracionesPDN\API.S1.SESEAP\appsettings.json -Raw) -replace 'apiName',$apiname | Set-Content .\appsettings.json

    $temporal = $content | Where-Object {$_ -like "clientId=*" }
    $clientid = $temporal -replace 'clientId=',''
	#sed -i "s/valorX/$clientid/g" appsettings.json
    (Get-Content -path C:\DeclaracionesPDN\API.S1.SESEAP\appsettings.json -Raw) -replace 'clientId',$clientid | Set-Content .\appsettings.json

    $temporal = $content | Where-Object {$_ -like "clientScopeRead=*" }
    $clientLectura = $temporal -replace 'clientScopeRead=',''
	#sed -i "s/valorLectura/$clientLectura/g" appsettings.json
    (Get-Content -path C:\DeclaracionesPDN\API.S1.SESEAP\appsettings.json -Raw) -replace 'clientScopeRead',$clientLectura | Set-Content .\appsettings.json

    $temporal = $content | Where-Object {$_ -like "clientScopeWrite=*" }
    $clientEscritura = $temporal -replace 'clientScopeWrite=',''
	#sed -i "s/valorEscritura/$clientEscritura/g" appsettings.json
    (Get-Content -path C:\DeclaracionesPDN\API.S1.SESEAP\appsettings.json -Raw) -replace 'clientScopeWrite',$clientEscritura | Set-Content .\appsettings.json

    $temporal = $content | Where-Object {$_ -like "mongoHostname=*" }
    $IP_HOSTNAME = $temporal -replace 'mongoHostname=',''
	#sed -i "s/valorY/$IP_HOSTNAME/g" appsettings.json
    (Get-Content -path C:\DeclaracionesPDN\API.S1.SESEAP\appsettings.json -Raw) -replace 'mongoHostname',$IP_HOSTNAME | Set-Content .\appsettings.json
    
    $temporal = $content | Where-Object {$_ -like "clientDescription=*" }
    $entidad = $temporal -replace 'clientDescription=',''
	#sed -i "s/valorZ/$entidad/g" appsettings.json
    (Get-Content -path C:\DeclaracionesPDN\API.S1.SESEAP\appsettings.json -Raw) -replace 'clientDescription',$entidad | Set-Content .\appsettings.json


    $temporal = $content | Where-Object {$_ -like "mongoUsername=*" }
    $valorusr = $temporal -replace 'mongoUsername=',''
	#sed -i "s/valorusr/$MONGO_USERNAME/g" appsettings.json
    (Get-Content -path C:\DeclaracionesPDN\API.S1.SESEAP\appsettings.json -Raw) -replace 'mongoUsername',$valorusr | Set-Content .\appsettings.json

    $temporal = $content | Where-Object {$_ -like "mongoPassword=*" }
    $valorpsw = $temporal -replace 'mongoPassword=',''
	#sed -i "s/valorpsw/$MONGO_PASSWORD/g" appsettings.json
    (Get-Content -path C:\DeclaracionesPDN\API.S1.SESEAP\appsettings.json -Raw) -replace 'mongoPassword',$valorpsw | Set-Content .\appsettings.json

    $temporal = $content | Where-Object {$_ -like "deploymentPort=*" }
    $PORT_HOSTNAME = $temporal -replace 'deploymentPort=',''
     (Get-Content -path C:\DeclaracionesPDN\API.S1.SESEAP\appsettings.json -Raw) -replace 'deploymentPort',$PORT_HOSTNAME | Set-Content .\appsettings.json

    $temporal = $content | Where-Object {$_ -like "mongoDatabase=*" }
    $mongoDatabase = $temporal -replace 'mongoDatabase=',''
    (Get-Content -path C:\DeclaracionesPDN\API.S1.SESEAP\appsettings.json -Raw) -replace 'mongoDatabase',$mongoDatabase | Set-Content .\appsettings.json

    $temporal = $content | Where-Object {$_ -like "mongoPort=*" }
    $mongoPort = $temporal -replace 'mongoPort=',''
    (Get-Content -path C:\DeclaracionesPDN\API.S1.SESEAP\appsettings.json -Raw) -replace 'mongoPort',$mongoPort | Set-Content .\appsettings.json

	Write-Output "La informacion que proporciono en su archivo parametrosConfiguracion.txt ya actualizo su archivo appSettings.json"
	Write-Output "Los recursos externos necesarios ya fueron descargados"
	Write-Output "La informacion requerida para configurar el entorno de trabajo ya esta lista para consumirse."


	Write-Output "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
	Write-Output "Iniciando despliegue de la API Microsoft .NET"

	Write-Output "= = = = = = = = = = = = = = = = = = = = = = = P A S O  1 = = = = = = = = = = = = = = = = = = = = = = ="
	Write-Output "Eliminando imagen previa del contenedor Docker llamada:" 
	#sudo docker rm -f dotnet
	Write-Output "= = = = = = = = = = = = = = = = = = = = = = = P A S O  2 = = = = = = = = = = = = = = = = = = = = = = ="
	Write-Output "Construyendo la imagen a partir del proyecto .NET"	
	#sudo docker build -t dotnet -f Dockerfile .
	Write-Output "= = = = = = = = = = = = = = = = = = = = = = = P A S O  3 = = = = = = = = = = = = = = = = = = = = = = ="
	Write-Output "ID de la imagen dentro del contenedor Docker es:"
	#sudo docker run --restart always --name dotnet -p $PORT_HOSTNAME:80 -d dotnet
	Write-Output "En adelante usted puede abrir en cualquier navegador de su red local la API capturando la url con la ip de su equipo mÃ¡s el puerto ${puerto}"
	Write-Output ""


	Write-Output  "                            C O N E X I O N   E S T A B L E C I D A!"
	Write-Output  "________________________________________________________________________________________________________________________________"
