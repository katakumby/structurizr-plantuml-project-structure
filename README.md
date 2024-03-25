#Directory structure 

#CLI builds

Download plantuml.jar  from https://github.com/plantuml/plantuml/releases to project root directory

PlantUML: ```cd src; java -jar plantuml.jar "./**" -o "../build/$";cd..;```

---

Run 

```docker run -it --rm -p 8080:8080 -v SRC_PATH:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=project1 structurizr/lite```

---

structurizr to PlantUML

```docker run -it --rm -v SRC_PATH:/usr/local/structurizr structurizr/cli export -workspace PROJECT_FORLDER/workspace.json -format plantuml -output build-raw/PROJECT_FORLDER```


./structurizr.sh export -workspace $dir/workspace.json -format plantuml -output  /usr/local/structurizr/build-raw/${dir##*/}

### Build

```docker build -t webserver --build-arg STRUCTURIZR_VERSION=v2024.03.03 --build-arg PLANTUML_VERSION=1.2024.3 .```

### Start

```docker run -it --rm -p 8080:80 --name web webserver```

