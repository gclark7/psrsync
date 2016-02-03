##2016-2-2
#greg.clark@bradleycorp.com
#hot folder script - developed to transfer files from PIM server to Ecommerce Servers
$timestamp = Get-Date -format yyyyMMdd
#$timestamp

$moveto = "C:\PIMExports\MagentoExports\archives\$timestamp"
#$moveto

$movefrom = "C:\PIMExports\MagentoExports\"
#$movefrom

$movewhat = "*.csv"
#$movewhat

#"$movefrom$movewhat"
New-Item -path "$moveto" - type directory
if(Test-Path("$moveto")){
	Move-Item -path "$movefrom$movewhat" -destination "$moveto"
}else{

}


