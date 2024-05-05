FROM node:18.13.0


ARG STRUCTURIZR_VERSION
ARG PLANTUML_VERSION
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true


RUN apt-get update && \
    apt-get install -y unzip wget openjdk-17-jdk graphviz python make gcc g++ libgbm-dev \
    && apt-get install gnupg wget -y && \
    wget --quiet --output-document=- https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /etc/apt/trusted.gpg.d/google-archive.gpg && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
    apt-get update && \
    apt-get install google-chrome-stable -y --no-install-recommends

RUN groupadd -r app && useradd -rm -g app -G audio,video app
# COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /usr/local/structurizr-cli

RUN set -e; \
    bash \
    && wget https://github.com/structurizr/cli/releases/download/${STRUCTURIZR_VERSION}/structurizr-cli.zip && \
    unzip -o structurizr-cli.zip && \
    rm structurizr-cli.zip
ENV PATH="${PATH}:/usr/local/structurizr-cli"

WORKDIR /usr/local/structurizr-lite
RUN set -e; \
    bash \
    && wget https://github.com/structurizr/lite/releases/download/${STRUCTURIZR_VERSION}/structurizr-lite.war

ENV PATH="${PATH}:/usr/local/structurizr-lite"

WORKDIR /usr/local/plantuml

RUN wget https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar -O plantuml.jar
ENV PATH="${PATH}:/usr/local/plantuml"
WORKDIR /home/app
EXPOSE 8080


CMD ["bash", "/home/app/build.sh"]