cp ../bin/aviatrix_ha.zip ../bin/old.zip
if [[ "$1" == "--dev" ]]; then
    echo "Adding dev_flag" 
    ./update.sh --dev
else
    echo "Not adding dev_flag"
    ./update.sh
fi
mkdir -p ../bin/new ../bin/old
unzip ../bin/aviatrix_ha.zip -d ../bin/new
unzip ../bin/old.zip -d ../bin/old
if diff -qr ../bin/new ../bin/old ; then 
    echo "Integrity check passed"
else
    echo "Integrity check failed"
fi
rm -rf ../bin/new ../bin/old ../bin/old.zip 
