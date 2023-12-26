#!/bin/bash

[[ "$1" == "" ]] && {
    echo "Usage: ./bpc-prepare.sh src.list"
    exit
}

rm -rf ./Symfony/Contracts
mkdir -p ./Symfony/Contracts/Translation

echo "placeholder-contracts-translation.php" > ./Symfony/src.list

for i in `cat $1`
do
    if [[ "$i" == \#* ]]
    then
        echo $i
    else
        echo "Contracts/Translation/$i" >> ./Symfony/src.list
        filename=`basename -- $i`
        if [ "${filename##*.}" == "php" ]
        then
            echo "phptobpc $i"
            phptobpc $i > ./Symfony/Contracts/Translation/$i
        else
            echo "cp       $i"
            cp $i ./Symfony/Contracts/Translation/$i
        fi
    fi
done
cp bpc.conf Makefile ./Symfony/
