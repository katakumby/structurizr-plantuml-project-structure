#!/bin/bash
for dir in ./src/*/     # list directories in the form "/tmp/dirname/"
do
    dir=${dir%*/}      # remove the trailing "/"
    if [ -e $dir/workspace.json ]
    then 
    ./structurizr.sh export -workspace $dir/workspace.json -format plantuml -output  /usr/local/structurizr/build-raw/${dir##*/}
    # java -jar plantuml.jar /usr/local/structurizr/build-raw/${dir##*/} -o /usr/share/nginx/html/structurizr/${dir##*/}
    java -jar plantuml.jar /usr/local/structurizr/build-raw/${dir##*/} -o /usr/local/structurizr/build/${dir##*/}
    else
    echo "nok ${dir##*/}"
    fi
done
for file in `find /usr/local/structurizr/build/ -type f -name '*.png'`; do mv -v "$file" "${file/structurizr-1-/}"; done
cd src 
java -jar ../plantuml.jar "./*/**.wsd" -o "../build/$"

mv /usr/local/structurizr/build /usr/share/nginx/html/build