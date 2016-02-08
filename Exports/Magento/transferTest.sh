#!/bin/bash
echo "***********"
echo "transfer starting test   $(date)";
#rsync -rtqz -e ssh --chmod=u+rwx,g+rwx,o+rwx /cygdrive/e/Informatica/ImageBankExports/imagebank_categories.xml pim@wsdev2:/var/pim/imagebank_categories.xml;
rsync -rtqz -e ssh --chmod=u+rwx,g+rwx,o+rwx /cygdrive/c/PIMExports/MagentoExports/moveToWSdev2.txt pim@wsdev2:/var/pim/testsync/moveToWSdev2.txt;
echo "transfer complete test   $(date)";