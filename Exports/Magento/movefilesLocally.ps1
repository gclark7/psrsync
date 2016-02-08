###2016-2-2
##greg.clark@bradleycorp.com
#hot folder script - developed to transfer files from PIM server to Ecommerce Servers

### include files
$ScriptDirectory = Split-Path $MyInvocation.MyCommand.Path
. (Join-Path $ScriptDirectory reusablefunctions.ps1)
#$ScriptDirectory = Split-Path $MyInvocation.MyCommand.Path
#. (Join-Path $ScriptDirectory setup.ps1) #works, extracting specific use from core functions

#### variables 
#$logfile = "C:\PIMExports\MagentoExports\logs\log.txt"
#$timestamp = Get-Date -format yyyyMMddHHmm
#$moveto = "C:\PIMExports\MagentoExports\archives\$timestamp"
#$moveto = "C:\PIMExports\MagentoExports\archives\idontExist"
#$movefrom = "C:\PIMExports\MagentoExports\"
#$movewhat = "*.csv"
#$triggerFile = "*.trg"

$fileCounter = 0
$readyToMoveFiles = $false
[String[]]$moveThis = $moveWhat




$userMessage = "Looking for Files..."
$userMessage



### test for files to move -- return if none

#if(-not (Test-Path("$movefromFolder\$movewhat")) ){
 #   $userMessage = "no files to move"
 #   createPathIfMissing -path "$logfile" -fileType "file"
 #   logThis -message $userMessage -logPath $logFile
 #   $userMessage
    
  #  Start-Sleep -s 1
  #  #return
#} # worked for single file

if(-not ($moveThis)){
    $userMessage = "no files specified"
    $userMessage
    Start-Sleep -s 1
    return
}

$moveThis

#if($moveWhat.Split(",").length -gt 1 ){ #checks for array larger than 1, more than 1 means more than 1 file must go or it fails.
if($moveThis.length -gt 1 ){ #checks for array larger than 1, more than 1 means more than 1 file must go or it fails.
    #must run for this many times
    #ForEach(($testPath in Get-Item "$movefromFolder\$movewhat")){ #doesn't run unless it is true
    
    ForEach($moveMe in $moveThis){    
        
        if(-not (Test-Path("$movefromFolder\$moveMe")) ){
            $userMessage = "files not found :: $movefromFolder\$moveMe"
            createPathIfMissing -path "$logfile" -fileType file
            logThis -message $userMessage -logPath $logFile
            #$userMessage
            
            #Start-Sleep -s 1
            #return
        }else{
            #found at least 1 file
            #$readyToMoveFiles = "TRUE"
            $fileCounter++
            
        }
        
        if($fileCounter -eq $moveThis.length){
            $readyToMoveFiles = $true
        }else{
            $userMessage = "not all files found...stopping..."
        }

    }
}else{#to do if only 1 file or single pattern

        if(-not (Test-Path("$movefromFolder\$moveThis")) ){
            $userMessage = "files not found :: $movefromFolder\$moveThis"
            createPathIfMissing -path "$logfile" -fileType file
            logThis -message $userMessage -logPath $logFile
            #$userMessage
            
            #Start-Sleep -s 1
            #return
        }else{
            #found at least 1 file
            #$readyToMoveFiles = "TRUE"
            $fileCounter++
            
        }
        
        if($fileCounter -ge $moveThis.length){
            $readyToMoveFiles = $true
        }else{
            $userMessage = "no files found...stopping..."
        }
    }

 
   if($readyToMoveFiles -eq $false){
       
        $userMessage
        
        Start-Sleep -s 1
        return
   }

$userMessage = "Moving Files..."
$userMessage
 
#### create this archive directory
New-Item -path $moveto -type directory -force

### perform move
if(Test-Path($moveto)){
	#Move-Item -path "$movefrom$movewhat" -destination $moveto -force works for 1 file or pattern "*.csv"
    $moveThis | Move-Item -path { "$movefromFolder\$_" } -destination $moveto 
    logThis -message "moved files :: $moveThis " -logPath $logFile
}else{
    $userMessage = "could not move files to $moveto"
    logThis -message $userMessage -logPath $logFile
    $userMessage
    
    Start-Sleep -s 1
    return
}

$userMessage = "Files have been archived...exiting"
$userMessage
Start-Sleep -s 1
