#!/bin/bash

> base.txt
> new_zip_
> pass.txt

function decode {
    unzip -z $zip_ | grep -v "Arch" >> base.txt
    decode_=$(unzip -z $zip_ | grep -v "Arch" | base64 --decode | tr 'A-Za-z' 'N-ZA-Mn-za-m')
    echo $decode_ > pass.txt
    unzip -P $(cat pass.txt) $zip_ | grep "extra" | awk '{print $2}' > new_zip_
}


zip_=$1
decode
while true; do
    zip_=$(cat new_zip_)
    decode
done
