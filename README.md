#Directory structure 

# CLI builds



## Docker build

```docker build -t doc-tools --build-arg STRUCTURIZR_VERSION=v2024.03.03 --build-arg PLANTUML_VERSION=1.2024.3 ./docker/build/```

### Build

```docker run -it --rm -p 8080:8080 -v .:/home/app/ --name doc doc-tools```

### Start

```docker compose up -d```

