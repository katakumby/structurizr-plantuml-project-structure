#Directory structure 

### Build

```docker build -t webserver --build-arg STRUCTURIZR_VERSION=v2024.03.03 --build-arg PLANTUML_VERSION=1.2024.3 .```

### Start

```docker run -it --rm -p 8080:80 --name web webserver```

