FROM nginx:latest
WORKDIR /usr/local/structurizr/


ARG STRUCTURIZR_VERSION
ARG PLANTUML_VERSION

RUN apt-get update && \
    apt-get install -y unzip wget  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN set -e; \
    bash \
    && wget https://github.com/structurizr/cli/releases/download/${STRUCTURIZR_VERSION}/structurizr-cli.zip && \
    unzip structurizr-cli.zip && \
    rm structurizr-cli.zip
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    apt-get install -y ant graphviz && \
    apt-get clean;
RUN wget https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar -O plantuml.jar

COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY . /usr/local/structurizr/
COPY start.sh /usr/local/structurizr/build.sh
RUN  /usr/local/structurizr/build.sh