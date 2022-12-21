#!/bin/bash
#Agregando capacidades de despliegue de ventanas de dialogo
Add-Type -AssemblyName "System.Windows.Forms"
#Set-ExecutionPolicy unrestricted
param(
    [string]$IP_HOSTNAME,
    [string]$PORT_HOSTNAME
)
Clear-Host

#Eliminando el directorio de API Seseap ##################################################
  eliminaProyectoAPINET 
#Eliminando el directorio de API Seseap ##################################################

#Descargando proyecto de API Seseap ######################################################
 descargaProyectoAPINET
#Descargando proyecto de API Seseap ######################################################

function eliminaProyectoAPINET 
{
    try
    {
        Remove-Item -Recurse -Force c:\DeclaracionesPDN\API.S1.SESEAP       
    }
    catch
    { 
        $listBox1.Items.Add("No existian archivos previos") 
    }
	#mkdir API.S1.SESEAP
	New-Item -Path "c:\DeclaracionesPDN" -Name "API.S1.SESEAP" -ItemType "directory"
    $listBox1.Items.Add("- - - - - - - - - - - - - - - -")  
}

function descargaProyectoAPINET
{
    Set-Location c:\DeclaracionesPDN\API.S1.SESEAP
    $listBox1.Items.Add("Iniciando descarga del proyecto API.NET SESEAP")
	Invoke-WebRequest -Uri https://github.com/gatroxrd/API-S1-SESEAP-Puebla/raw/main/PDEPuebla.S1.PDN.zip -OutFile PDEPuebla.S1.PDN.zip
	#Write-Output "Descomprimiendo archivos descargados"
    $listBox1.Items.Add("Archivo -.ZIP- con la API.NET SESEAP descargado")
    $listBox1.Items.Add("Descomprimiendo archivos en c:\DeclaracionesPDN")
	
	Expand-Archive -LiteralPath 'c:\DeclaracionesPDN\API.S1.SESEAP\PDEPuebla.S1.PDN.zip' -DestinationPath 'C:\DeclaracionesPDN\API.S1.SESEAP'
	#Write-Output "Eliminando archivo .zip"
    $listBox1.Items.Add("Eliminando archivo -.ZIP-")
	#rm  PDEPuebla.S1.PDN.zip
    Remove-Item -Recurse -Force C:\DeclaracionesPDN\API.S1.SESEAP\PDEPuebla.S1.PDN.zip
    #Write-Output "Cargando y procesando el archivo con los parametros de Configuracion"
    $listBox1.Items.Add("Proyecto API.NET SESEAP disponible")
    $listBox1.Items.Add("- - - - - - - - - - - - - - - -") 
}


function extraeParametrosAppSettings 
{
    Set-Location c:\DeclaracionesPDN\API.S1.SESEAP
    #[void][System.Windows.Forms.Messagebox]::Show("Iniciar descarga del proyecto .NET desde el repositorio GitHub de la Unidad de Servicios Tecnológicos y Plataforma Digital Puebla.","Descarga del proyecto API.NET")
    #$listBox1.Items.Add("        DESCARGA GITHUB --> API.NET ")   

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
    (Get-Content -path C:\DeclaracionesPDN\API.S1.SESEAP\appsettings.json -Raw) -replace 'clientScopeRead',"read:${clientLectura}" | Set-Content .\appsettings.json

    $temporal = $content | Where-Object {$_ -like "clientScopeWrite=*" }
    $clientEscritura = $temporal -replace 'clientScopeWrite=',''
	#sed -i "s/valorEscritura/$clientEscritura/g" appsettings.json
    (Get-Content -path C:\DeclaracionesPDN\API.S1.SESEAP\appsettings.json -Raw) -replace 'clientScopeWrite',"write:${clientEscritura}" | Set-Content .\appsettings.json

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

    #$listBox1.Items.Add("Archivo appSettings.json ya fue configurado")
    try
                        {
                            MontandoDocker;
                        }
    catch
                        {}
}

function MontandoDocker {
    Set-Location c:\DeclaracionesPDN\API.S1.SESEAP
    try
    {
        docker image rm dotnet@latest -f
        #$listBox1.Items.Add("Buscando y eliminando imagenes previas en el Contenedor")
    }
    catch
    {
            try{
                docker image rm dotnet -f
            }
            catch{
                #$listBox1.Items.Add("No habia imagenes previas")
            }
    }
	#sudo docker build -t dotnet -f Dockerfile .
    docker build -t dotnet -f Dockerfile .
    #$listBox1.Items.Add("Contruyendo imagen Docker desde Dockerfile")
	#sudo docker run --restart always --name dotnet -p $PORT_HOSTNAME:80 -d dotnet
    #$listBox1.Items.Add("Montando imagen dotnet en el contenedor Docker")
    try
    {
        docker run --name dotnet -p ${PORT_HOSTNAME}:80 -d dotnet
        #[system.Diagnostics.Process]::Start("msedge","${IP_HOSTNAME}:${PORT_HOSTNAME}")
        #[void][System.Windows.Forms.Messagebox]::Show("La imagen dotnet esta montada en su Docker y la API.NET funcionando.","API.NET instalada")
        Set-Location c:\DeclaracionesPDN
        break
    }
    catch
    {
        Set-Location c:\DeclaracionesPDN\
        break
    }
  
}



        
