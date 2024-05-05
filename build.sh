#!/bin/bash


npm i puppeteer
filearray=( $(find * -type f -name "workspace.json") )
for value in "${filearray[@]}"
do
    noSrc=${value#*/}
    dirPath=${noSrc/workspace.json/""}
    export STRUCTURIZR_WORKSPACE_PATH=${dirPath}
    java -Djdk.util.jar.enableMultiRelease=false -jar /usr/local/structurizr-lite/structurizr-lite.war /home/app/src/ &
    echo "Workspace: $noSrc -> ${dirPath}"    
    sleep 2
    node /home/app/export-diagrams.js http://localhost:8080/workspace/diagrams png ${dirPath}
    # kill %1
    kill $!
    # sleep 2
    structurizr.sh export -workspace ./src/$dirPath/workspace.json -format plantuml -output  /home/app/build-raw/${dirPath}
    java -jar /usr/local/plantuml/plantuml.jar /home/app/build-raw/$dirPath -o /home/app/build/$dirPath
done
for file in `find /home/app/build/ -type f -name '*.png'`; do mv -v "$file" "${file/structurizr-1-/auto-}"; done
cd src 
java -jar /usr/local/plantuml/plantuml.jar "./*/**.puml" -o "../build/$"