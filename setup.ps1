###2016-2-3
##greg.clark@bradleycorp.com
#prepare folder directory to work with transfer system
param([String]$parms="none")

### variables -- do not change the names of variables
###  change values as needed

$workingDirectory = "C:\PIMExports\MagentoExports"
$logfileFolder = "$workingDirectory\logs"
$logfile = "$logFileFolder\log.txt"
$archiveFolder = "$workingDirectory\archives"
$errorFolder = "$workingDirectory\errors"
$maxLogSizeKb = 4000

$timestamp = Get-Date -format yyyyMMddHHmm
$moveto = "$archiveFolder\$timestamp"
$movetoError = "$errorFolder\$timestamp"
$movefrom = "$workingDirectory"

# accepts a list of files
$movewhat = "*.csv"

# single file to be used to indicate all files are present
$triggerFile = "*.trg"


#prompt to set variables
# ToDO

#create configFile
#ToDo

#show me variables
#$workingDirectory 
#$logfileFolder 
#$logfile 
#$archiveFolder 
#$errorFolder 
#$maxLogSizeKb 

#$timestamp 
#$moveto 
#$movefrom 
