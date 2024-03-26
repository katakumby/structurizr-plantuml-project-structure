#!/bin/bash
for file in $(find /usr/local/structurizr/src/ -name 'workspace.json'); 
do

    dirx=${file#/usr/local/structurizr/src/}
    dir=${file%*/}      
    wdir=${dirx%workspace.json}    
    if [ -e $file ]
    then 
    ./structurizr.sh export -workspace $file -format plantuml -output  /usr/local/structurizr/build-raw/${wdir}
    java -jar plantuml.jar /usr/local/structurizr/build-raw/${wdir} -o /usr/local/structurizr/build/${wdir}
    else
    echo "nok ${dir##*/}"
    fi 
done
for file in `find /usr/local/structurizr/build/ -type f -name '*.png'`; do mv -v "$file" "${file/structurizr-1-/}"; done
cd src 
java -jar ../plantuml.jar "./*/**.wsd" -o "../build/$"

mv /usr/local/structurizr/build /usr/share/nginx/html/build