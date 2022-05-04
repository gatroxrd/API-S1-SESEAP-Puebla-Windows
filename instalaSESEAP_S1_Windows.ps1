#!/bin/bash
#Agregando capacidades de despliegue de ventanas de dialogo
Add-Type -AssemblyName "System.Windows.Forms"
#Set-ExecutionPolicy unrestricted

function GenerateForm {

    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
    
    $form1 = New-Object System.Windows.Forms.Form
    $button1 = New-Object System.Windows.Forms.Button
    $listBox1 = New-Object System.Windows.Forms.ListBox
    $radioButton1 = New-Object System.Windows.Forms.RadioButton
    $InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
    
    #$b1= $false
    
    $handler_button1_Click= 
    {
        Clear-Host  
        Set-Location C:\DeclaracionesPDN
        $listBox1.Items.Clear();    

        if ($radioButton1.Checked)   
         {
              $listBox1.Items.Clear()
              ObtenAPI.NET
              MontandoDocker
         } 
         else 
         {
              $listBox1.Items.Clear()
              $listBox1.Items.Add("No selecciono ninguna opción, verifíquelo!")
         }
    }
    
    $OnLoadForm_StateCorrection=
    {#Correct the initial state of the form to prevent the .Net maximized form issue
        $form1.WindowState = $InitialFormWindowState
    }
    
    #----------------------------------------------
    #region Generated Form Code
    $form1.Text = "API de comunicación SESEA Puebla - PDN"
    $form1.Name = "form1"
    $form1.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 600
    $System_Drawing_Size.Height = 250
    $form1.ClientSize = $System_Drawing_Size
    
    $button1.TabIndex = 4
    $button1.Name = "button1"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 75
    $System_Drawing_Size.Height = 23
    $button1.Size = $System_Drawing_Size
    $button1.UseVisualStyleBackColor = $True
    
    $button1.Text = "Ejecutar"
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 27
    $System_Drawing_Point.Y = 156
    $button1.Location = $System_Drawing_Point
    $button1.DataBindings.DefaultDataSourceUpdateMode = 0
    $button1.add_Click($handler_button1_Click)
    
    $form1.Controls.Add($button1)
    
    $listBox1.FormattingEnabled = $True
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 380
    $System_Drawing_Size.Height = 212
    $listBox1.Size = $System_Drawing_Size
    $listBox1.DataBindings.DefaultDataSourceUpdateMode = 0
    $listBox1.Name = "listBox1"
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 200
    $System_Drawing_Point.Y = 13
    $listBox1.Location = $System_Drawing_Point
    $listBox1.Font = New-Object System.Drawing.Font("Century Gothic",8,[System.Drawing.FontStyle]::Regular)
    $listBox1.TabIndex = 3
    
    $form1.Controls.Add($listBox1)
    
    $radioButton1.UseVisualStyleBackColor = $True
    $System_Drawing_Size = New-Object System.Drawing.Size

    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 20
    $System_Drawing_Point.Y = 13
    $radioButton1.Location = $System_Drawing_Point
    $radioButton1.Name = "radioButton1";
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 250
    $System_Drawing_Size.Height = 30
    $radioButton1.Size = $System_Drawing_Size
    $radioButton1.TabIndex = 3;
    $radioButton1.TabStop = true;
    $radioButton1.Text = ""
    $radioButton1.Text = "Instalación básica por parametrosConfiguracion.txt";
    $radioButton1.UseVisualStyleBackColor = true;
    #$radioButton1.CheckedChanged += new System.EventHandler($radioButton1_CheckedChanged);

    $form1.Controls.Add($radioButton1)
    
   
    #Save the initial state of the form
    $InitialFormWindowState = $form1.WindowState
    #Init the OnLoad event to correct the initial state of the form
    $form1.add_Load($OnLoadForm_StateCorrection)
    #Show the Form
    $form1.ShowDialog()| Out-Null

    
    } #End Function Generador del popup de presentación del Script

#Call the Function
GenerateForm

function ObtenAPI.NET {
    
    #[void][System.Windows.Forms.Messagebox]::Show("Script de descarga,instalacion y montado del contenedor Docker de la API SESEAP S1. Desarrollado por la Unidad de Servicios Tecnológicos y Plataforma Digital","Secretaria Ejecutiva del Sistema Estatal Anticorrupcion de Puebla (SESEAP)")
    [void][System.Windows.Forms.Messagebox]::Show("Iniciar descarga del proyecto .NET desde el repositorio GitHub de la Unidad de Servicios Tecnológicos y Plataforma Digital Puebla.","Descarga del proyecto API.NET")
	#Write-Output "Iniciando descarga del proyecto .NET del repositorio GitHub de USTPD-SESEAP"
    $listBox1.Items.Add("        DESCARGA GITHUB --> API.NET ")   
    try
    {
        $listBox1.Items.Add("Eliminando archivos previos de la API")
        Remove-Item -Recurse -Force c:\DeclaracionesPDN\API.S1.SESEAP
    }
    catch
    {}
	#mkdir API.S1.SESEAP
	New-Item -Path "c:\DeclaracionesPDN" -Name "API.S1.SESEAP" -ItemType "directory"
	Set-Location c:\DeclaracionesPDN\API.S1.SESEAP
	Invoke-WebRequest -Uri https://github.com/gatroxrd/API-S1-SESEAP-Puebla/raw/main/PDEPuebla.S1.PDN.zip -OutFile PDEPuebla.S1.PDN.zip
	#Write-Output "Descomprimiendo archivos descargados"
    $listBox1.Items.Add("Archivo .zip con la API.NET descargado")
    $listBox1.Items.Add("Descomprimiendo archivos en c:\DeclaracionesPDN")
	
	Expand-Archive -LiteralPath 'c:\DeclaracionesPDN\API.S1.SESEAP\PDEPuebla.S1.PDN.zip' -DestinationPath 'C:\DeclaracionesPDN\API.S1.SESEAP'
	#Write-Output "Eliminando archivo .zip"
    $listBox1.Items.Add("Eliminando archivo .zip")
	#rm  PDEPuebla.S1.PDN.zip
    Remove-Item -Recurse -Force C:\DeclaracionesPDN\API.S1.SESEAP\PDEPuebla.S1.PDN.zip
    #Write-Output "Cargando y procesando el archivo con los parametros de Configuracion"
    $listBox1.Items.Add("Extrayendo valores y configurando appSettings.json")
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

    $listBox1.Items.Add("Archivo appSettings.json ya fue configurado")
}

function MontandoDocker {
 	#Write-Output "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
	#Write-Output "Iniciando despliegue de la API Microsoft .NET"
    $listBox1.Items.Add("        MONTANDO IMAGEN DOCKER  ")

	Write-Output "= = = = = = = = = = = = = = = = = = = = = = = P A S O  1 = = = = = = = = = = = = = = = = = = = = = = ="
	Write-Output "Eliminando imagen previa del contenedor Docker llamada:" 
	#sudo docker rm -f 
    Set-Location c:\DeclaracionesPDN\API.S1.SESEAP
    try
    {
        docker rm -f dotnet
    }
    catch{
        Write-Output "Imagen dotnet preexistente no encontrada"
    }
	Write-Output "= = = = = = = = = = = = = = = = = = = = = = = P A S O  2 = = = = = = = = = = = = = = = = = = = = = = ="
	Write-Output "Construyendo la imagen a partir del proyecto .NET"	
	#sudo docker build -t dotnet -f Dockerfile .
    docker build -t dotnet -f Dockerfile .
	Write-Output "= = = = = = = = = = = = = = = = = = = = = = = P A S O  3 = = = = = = = = = = = = = = = = = = = = = = ="
	Write-Output "ID de la imagen dentro del contenedor Docker es:"
	#sudo docker run --restart always --name dotnet -p $PORT_HOSTNAME:80 -d dotnet
    docker run dotnet -p 8095:80  dotnet
	Write-Output "En adelante usted puede abrir en cualquier navegador de su red local la API capturando la url con la ip de su equipo mÃ¡s el puerto ${puerto}"
	Write-Output ""


	Write-Output  "                            C O N E X I O N   E S T A B L E C I D A!"
	Write-Output  "________________________________________________________________________________________________________________________________"   
}



        
