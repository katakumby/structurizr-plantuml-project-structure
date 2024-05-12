#Directory structure 

# CLI builds



## Docker build

```docker build -t doc-tools --build-arg STRUCTURIZR_VERSION=v2024.03.03 --build-arg PLANTUML_VERSION=1.2024.3 ./docker/build/```

### Build

```docker run -it --rm -p 8080:8080 -v .:/home/app/ --name doc doc-tools```

### Start

```docker compose up -d```

### Docs

```docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material```

--- 

### todo: sub-repos


git clone -n --depth=1 --filter=tree:0 https://github.com/katakumby/test1-docs
cd test1-docs
git sparse-checkout set --no-cone docs
git checkout

