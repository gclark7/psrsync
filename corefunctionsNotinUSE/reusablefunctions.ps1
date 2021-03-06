### 2016-2-3
## greg.clark@bradleycorp.com
# functions useful for many purposes

#create the path if missing -- intended for logs and archive directory
#can be used to create whatever is missing
#default file type is directory

function createPathIfMissing{
    param( [String]$path, [String] $fileType)
    $defaultType = 'directory'
    if(-not (Test-Path($path)) ){
    
        if($fileType -like "*file*" ){
            $defaultType = "file"
        }
        
        New-Item -path $path -type $defaultType
    }
}

#write message to log file

function logThis{
    param([Object] $messageObject, [String]$logPath)
    (Get-Date -f MM-dd-yyyy_HH:mm) + "     " + $messageObject | Out-File -filepath $logPath -append
}

