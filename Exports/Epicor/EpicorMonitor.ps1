### 2016-2-4
## greg.clark@bradleycorp.com
# folder monitor for :: Magento Exports from PIM Server to Magento Environment

$ScriptDirectory = Split-Path $MyInvocation.MyCommand.Path
. (Join-Path $ScriptDirectory configEpicor.ps1)


$userMessage = "running time"
$userMessage

$ScriptDirectory = Split-Path $MyInvocation.MyCommand.Path
. (Join-Path $ScriptDirectory movefiles.ps1)


$userMessage = "done...closing program"
$userMessage

Start-Sleep -s 3
"********************** compare variables"
$workingDirectory 
$moveto 
$movefromFolder 
$moveWhat



exit