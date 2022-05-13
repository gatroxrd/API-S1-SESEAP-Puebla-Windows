#!/bin/bash
#Agregando capacidades de despliegue de ventanas de dialogo
Add-Type -AssemblyName "System.Windows.Forms"
#Set-ExecutionPolicy unrestricted
param(
    [string]$IP_HOSTNAME,
    [string]$PORT_HOSTNAME
)
clear


function eliminaProyectoAPINET{
    Set-Location c:\DeclaracionesPDN
    try
    {
        Remove-Item -Recurse -Force c:\DeclaracionesPDN\API.S1.SESEAP
        $listBox1.Items.Add("Eliminando archivos previos de la API")       
    }
    catch
    { 
    }
	#mkdir API.S1.SESEAP
	New-Item -Path "c:\DeclaracionesPDN" -Name "API.S1.SESEAP" -ItemType "directory"
    descargaProyectoAPINET;
                        
}

function descargaProyectoAPINET{
    Set-Location c:\DeclaracionesPDN\API.S1.SESEAP
    $listBox1.Items.Add("Iniciando descarga de API.NET")
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
    extraeParametrosAppSettings;
}

function extraeParametrosAppSettings {
    Set-Location c:\DeclaracionesPDN\API.S1.SESEAP
    #[void][System.Windows.Forms.Messagebox]::Show("Iniciar descarga del proyecto .NET desde el repositorio GitHub de la Unidad de Servicios Tecnológicos y Plataforma Digital Puebla.","Descarga del proyecto API.NET")
    $listBox1.Items.Add("        DESCARGA GITHUB --> API.NET ")   

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

    $listBox1.Items.Add("Archivo appSettings.json ya fue configurado")
    try
                        {
                            MontandoDocker;
                        }
    catch
                        {}
}

function MontandoDocker {
    [void][System.Windows.Forms.Messagebox]::Show("Ahora se creará y montará la imagen DotNet en el Docker de su equipo. quedará anclado en la url ${IP_HOSTNAME}:${PORT_HOSTNAME}","Montando la API.NET en Docker")
    #Write-Output "${IP_HOSTNAME}:${PORT_HOSTNAME}"
    $listBox1.Items.Add("        MONTANDO IMAGEN DOCKER  ")
	#sudo docker rm -f 
    Set-Location c:\DeclaracionesPDN\API.S1.SESEAP
    try
    {
        docker image rm dotnet -f
        $listBox1.Items.Add("Buscando y eliminando imagenes previas en el Contenedor")
    }
    catch
    {
            try{
                docker image rm dotnet -f
            }
            catch{
                $listBox1.Items.Add("No habia imagenes previas")
            }
    }
	#sudo docker build -t dotnet -f Dockerfile .
    Set-Location c:\DeclaracionesPDN\API.S1.SESEAP
    docker build -t dotnet -f Dockerfile .
    $listBox1.Items.Add("Contruyendo imagen Docker desde Dockerfile")
	#sudo docker run --restart always --name dotnet -p $PORT_HOSTNAME:80 -d dotnet
    $listBox1.Items.Add("Montando imagen dotnet en el contenedor Docker")
    try
    {
        docker run --name dotnet -p ${PORT_HOSTNAME}:80 -d dotnetp
        Set-Location c:\DeclaracionesPDN\API.S1.SESEAP
        #[system.Diagnostics.Process]::Start("msedge","${IP_HOSTNAME}:${PORT_HOSTNAME}")
        #[void][System.Windows.Forms.Messagebox]::Show("La imagen dotnet esta montada en su Docker y la API.NET funcionando.","API.NET instalada")
        break
    }
    catch
    {
        Set-Location c:\DeclaracionesPDN\API.S1.SESEAP
        break
    }

}

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
        
        $listBox1.Items.Clear();    
        if ($radioButton1.Checked)   
         {
              $listBox1.Items.Clear()

              $form = New-Object System.Windows.Forms.Form
              $form.Text = 'Descargar Proyecto .NET'
              $form.Size = New-Object System.Drawing.Size(300,200)
              $form.StartPosition = 'CenterScreen'
              
              $okButton = New-Object System.Windows.Forms.Button
              $okButton.Location = New-Object System.Drawing.Point(75,120)
              $okButton.Size = New-Object System.Drawing.Size(75,23)
              $okButton.Text = 'Descargar'
              $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
              $form.AcceptButton = $okButton
              $form.Controls.Add($okButton)
              
              $cancelButton = New-Object System.Windows.Forms.Button
              $cancelButton.Location = New-Object System.Drawing.Point(150,120)
              $cancelButton.Size = New-Object System.Drawing.Size(75,23)
              $cancelButton.Text = 'Continuar'
              $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
              $form.CancelButton = $cancelButton
              $form.Controls.Add($cancelButton)
              
              $label = New-Object System.Windows.Forms.Label
              $label.Location = New-Object System.Drawing.Point(10,20)
              $label.Size = New-Object System.Drawing.Size(280,60)
              $label.Text = 'Desea descargar la más reciente versión del proyecto API.NET? Esta acción eliminará la versión previamente descargada y solo le dejará con la más reciente del proyecto API .NET'
              $form.Controls.Add($label)
              
              #$textBox = New-Object System.Windows.Forms.TextBox
              #$textBox.Location = New-Object System.Drawing.Point(10,40)
              #$textBox.Size = New-Object System.Drawing.Size(260,20)
              #$form.Controls.Add($textBox)
              
              $form.Topmost = $true
              
              #$form.Add_Shown({$textBox.Select()})
              $result = $form.ShowDialog()
              if ($result -eq [System.Windows.Forms.DialogResult]::OK)
                    {
                        eliminaProyectoAPINET; 
                        break;
                    }
              else
              {
                    extraeParametrosAppSettings;
              }

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
    $form1.StartPosition = 'CenterScreen'
    
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
    $radioButton1.Text = ""
    $radioButton1.Font = New-Object System.Drawing.Font("Century Gothic",8,[System.Drawing.FontStyle]::Regular)
    $radioButton1.Text = "Instalación básica por parametrosConfiguracion.txt";
    $radioButton1.UseVisualStyleBackColor = $True;

    $form1.Controls.Add($radioButton1)
    
   
    #Save the initial state of the form
    $InitialFormWindowState = $form1.WindowState
    #Init the OnLoad event to correct the initial state of the form
    $form1.add_Load($OnLoadForm_StateCorrection)
    #Show the Form
    $form1.ShowDialog()
   # | Out-Null

    
    } #End Function Generador del popup de presentación del Script

#Call the Function
GenerateForm




        
