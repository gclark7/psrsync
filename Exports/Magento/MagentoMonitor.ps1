### 2016-2-4
## greg.clark@bradleycorp.com
# folder monitor for :: Magento Exports from PIM Server to Magento Environment

param([String]$configFile="none")
$corefunctions = "C:\PIM_ServerScripts\FileTransfers\corefunctions\corefunctions.ps1"

try{
    $ScriptDirectory = Split-Path $MyInvocation.MyCommand.Path
    . (Join-Path $ScriptDirectory config.ps1)
}catch{
     Write-Host "unable to load configFile" 
    (Get-Date -f MM-dd-yyyy_HH:mm) + "     " + $messageObject | Out-File -filepath "$logFile" -append
    exit
}

Set-Location $workingDirectory


try { .("$corefunctions") }
catch {
    Write-Host "unable to load core functions at $corefunctions" 
    (Get-Date -f MM-dd-yyyy_HH:mm) + "     " + $messageObject | Out-File -filepath "$logFile" -append
    exit
}


$userMessage = "running time"
$userMessage

#$ScriptDirectory = Split-Path $MyInvocation.MyCommand.Path
#. (Join-Path $ScriptDirectory movefilesLocally.ps1)

#transfer files to remote Server
#convertWindowsPathToCygwinPath 

convertWindowsPathToCygwinPath -windowsPath "$movefromFolder\$moveWhat" -logLocation $logFile
    

#archive files    
moveFilesLocally -moveFrom $movefromFolder -moveTo $moveTo -moveWhat $moveWhat -logLocation $logFile -makeMoveTo $true


$userMessage = "done...closing program"
$userMessage

Start-Sleep -s 3
exit