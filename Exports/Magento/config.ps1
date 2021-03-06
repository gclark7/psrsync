###2016-2-3
##greg.clark@bradleycorp.com
#prepare folder directory to work with transfer system

param([String]$parms="none")


###  change values as needed

#### local folders
$workingDirectory = "C:\PIMExports\MagentoExports"
$logfileFolder = "$workingDirectory\logs"
$logfile = "$logFileFolder\log.txt"
$archiveFolder = "$workingDirectory\archives"
$errorFolder = "$workingDirectory\errors"
$maxLogSizeKb = 4000

$timestamp = Get-Date -format yyyyMMddHHmm
$moveto = "$archiveFolder\$timestamp"
$movetoError = "$errorFolder\$timestamp"
#working folder
$movefromFolder = "$workingDirectory"

#### Files to move - files move locally ** will also transfer to remote server if remote defaults are changed

# accepts a pattern for files, array of files, array of patterns
#example $movewhat = "*_ecom_*.csv" 
#example $movewhat = @("*_ecom_categoriesfile.csv","*_ecom_itemdatafile.csv")
#example $movewhat = ('1449855069195__ecom_categoriesfile.csv','1449855147792__ecom_itemdatafile.csv')
#example $movewhat = '1454362656727Ecommerce Project_Magento_Categories.csv'
#$movewhat = "1449855069195__ecom_categoriesfile.csv","1449855147792__ecom_itemdatafile.csv"
#$movewhat = "*.csv"
#$movewhat = @("1449855069195__ecom_categoriesfile.csv","1449855147792__ecom_itemdatafile.csv")
$movewhat = "*__ecom_categoriesfile.csv","*__ecom_itemdatafile.csv"


#### transfer to remote server
# single file to be used to indicate all files are present
#$triggerFile = "" #default value, comment this to specify trigger
$triggerFile = "*.trg" 


$transferToRemoteURL = "192.168.1.13:"  #$1
$remoteUser = "greg" #$2
$remoteUserPass = "s3rv3rOne" #$3
$transferToRemoteDirectory = "" #$4

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
#$movefromFolder 
#$moveWhat