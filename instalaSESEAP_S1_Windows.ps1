#!/bin/bash
#Agregando capacidades de despliegue de ventanas de dialogo
Add-Type -AssemblyName "System.Windows.Forms"
Set-ExecutionPolicy unrestricted

function GenerateForm {

    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
    
    $form1 = New-Object System.Windows.Forms.Form
    $button1 = New-Object System.Windows.Forms.Button
    $listBox1 = New-Object System.Windows.Forms.ListBox
    $checkBox3 = New-Object System.Windows.Forms.CheckBox
    $checkBox2 = New-Object System.Windows.Forms.CheckBox
    $checkBox1 = New-Object System.Windows.Forms.
    $radioButton2 = New-Object System.Windows.Forms.RadioButton
    $radioButton1 = New-Object System.Windows.Forms.RadioButton
    $InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
    
    $b1= $false
    $b2= $false
    $b3= $false
    
    #----------------------------------------------
    #Generated Event Script Blocks
    #----------------------------------------------
    
    $handler_button1_Click= 
    {
        $listBox1.Items.Clear();    
    
        if ($checkBox1.Checked)     {  $listBox1.Items.Add( "Checkbox 1 is checked"  ) }
    
        if ($checkBox2.Checked)    {  $listBox1.Items.Add( "Checkbox 2 is checked"  ) }
    
        if ($checkBox3.Checked)    {  $listBox1.Items.Add( "Checkbox 3 is checked"  ) }

        if ($radioButton1.Checked)    {  $listBox1.Items.Add( "Radio botón 1 is checked"  ) }
    
        if ( !$checkBox1.Checked -and !$checkBox2.Checked -and !$checkBox3.Checked )
         {  
              $listBox1.Items.Add("No CheckBox selected....")
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
    $System_Drawing_Size.Width = 550
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
    $System_Drawing_Size.Width = 301
    $System_Drawing_Size.Height = 212
    $listBox1.Size = $System_Drawing_Size
    $listBox1.DataBindings.DefaultDataSourceUpdateMode = 0
    $listBox1.Name = "listBox1"
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 137
    $System_Drawing_Point.Y = 13
    $listBox1.Location = $System_Drawing_Point
    $listBox1.TabIndex = 3
    
    $form1.Controls.Add($listBox1)
    
    
    $checkBox3.UseVisualStyleBackColor = $True
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 104
    $System_Drawing_Size.Height = 24
    $checkBox3.Size = $System_Drawing_Size
    $checkBox3.TabIndex = 2
    $checkBox3.Text = "CheckBox 3"
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 27
    $System_Drawing_Point.Y = 75
    $checkBox3.Location = $System_Drawing_Point
    $checkBox3.DataBindings.DefaultDataSourceUpdateMode = 0
    $checkBox3.Name = "checkBox3"
    
    $form1.Controls.Add($checkBox3)
    
    
    $checkBox2.UseVisualStyleBackColor = $True
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 104
    $System_Drawing_Size.Height = 24
    $checkBox2.Size = $System_Drawing_Size
    $checkBox2.TabIndex = 1
    $checkBox2.Text = "CheckBox 2"
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 27
    $System_Drawing_Point.Y = 44
    $checkBox2.Location = $System_Drawing_Point
    $checkBox2.DataBindings.DefaultDataSourceUpdateMode = 0
    $checkBox2.Name = "checkBox2"

    $radioButton1.UseVisualStyleBackColor = $True
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 130
    $System_Drawing_Size.Height = 24
    $radioButton1.Size = $System_Drawing_Size
    $radioButton1.Location = new System.Drawing.Point(27, 90);
    $radioButton1.Name = "radioButton1";
    $radioButton1.RightToLeft = System.Windows.Forms.RightToLeft.No;
    $radioButton1.Size = new System.Drawing.Size(382, 23);
    $radioButton1.TabIndex = 3;
    $radioButton1.TabStop = true;
    $radioButton1.Text = "Instalación básica por parametrosConfiguracion.txt";
    $radioButton1.UseVisualStyleBackColor = true;
    $radioButton1.CheckedChanged += new System.EventHandler($radioButton1_CheckedChanged);

    $form1.Controls.Add($radioButton1)
    
    $form1.Controls.Add($checkBox2)
    
    
    
        $checkBox1.UseVisualStyleBackColor = $True
        $System_Drawing_Size = New-Object System.Drawing.Size
        $System_Drawing_Size.Width = 104
        $System_Drawing_Size.Height = 24
        $checkBox1.Size = $System_Drawing_Size
        $checkBox1.TabIndex = 0
        $checkBox1.Text = "CheckBox 1"
        $System_Drawing_Point = New-Object System.Drawing.Point
        $System_Drawing_Point.X = 27
        $System_Drawing_Point.Y = 13
        $checkBox1.Location = $System_Drawing_Point
        $checkBox1.DataBindings.DefaultDataSourceUpdateMode = 0
        $checkBox1.Name = "checkBox1"
    
    $form1.Controls.Add($checkBox1)
    
    
    #Save the initial state of the form
    $InitialFormWindowState = $form1.WindowState
    #Init the OnLoad event to correct the initial state of the form
    $form1.add_Load($OnLoadForm_StateCorrection)
    #Show the Form
    $form1.ShowDialog()| Out-Null
    
    } #End Function


Clear-Host
Set-Location C:\DeclaracionesPDN

#Call the Function
GenerateForm

Write-Host "+ + + + + + + + + + + API S1 Conexion Entes - SESEAP - PDN + + + + + + + + + + + + + + + + + + +" -ForegroundColor Green -NoNewline; 
Write-Output "Script de descarga,instalacion y montado en el contenedor Docker de la API SESEAP S1"
Write-Output ""
Write-Output "Secretaria Ejecutiva del Sistema Estatal Anticorrupcion de Puebla (SESEAP)"
Write-Output "Unidad de Servicios Tecnologicos y Plataforma Digital (USTPD)"
Write-Output "                                                                            Version Windows al 22 de abril de 2022"
Write-Output "+ + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + "

[void][System.Windows.Forms.Messagebox]::Show("Script de descarga,instalacion y montado del contenedor Docker de la API SESEAP S1. Desarrollado por la Unidad de Servicios Tecnológicos y Plataforma Digital","Secretaria Ejecutiva del Sistema Estatal Anticorrupcion de Puebla (SESEAP)")

	#sudo apt install zip unzip
	#set -a
	#source <(cat parametrosConfiguracion.txt|\
	#	sed -e '/^#/d;/^\s*$/d' -e "s/'/'\\\''/g" -e "s/=\(.*\)/='\1'/g")
	#set +a

    [void][System.Windows.Forms.Messagebox]::Show("Iniciando descarga del proyecto .NET del repositorio GitHub de USTPD-SESEAP.","Descarga del proyecto .NET")
	#Write-Output "Iniciando descarga del proyecto .NET del repositorio GitHub de USTPD-SESEAP"
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


        
