#!/bin/bash
# variables to look for
#$transferToRemoteURL = "192.168.1.13:"  #$1
#$remoteUser = "greg" #$2
#$remoteUserPass = "s3rv3rOne" #$3
#$transferToRemoteDirectory = "" #$4

echo "***********"
echo "transfer starting test   $(date)";
#rsync -rtqz -e ssh --chmod=u+rwx,g+rwx,o+rwx /cygdrive/e/Informatica/ImageBankExports/imagebank_categories.xml pim@wsdev2:/var/pim/imagebank_categories.xml;
rsync -rtqz -e ssh --chmod=u+rwx,g+rwx,o+rwx /cygdrive/c/PIMExports/MagentoExports/moveToWSdev2.txt pim@wsdev2:/var/pim/testsync/moveToWSdev2.txt;
echo "transfer complete test   $(date)";