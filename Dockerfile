# Docker usage example: 
#   $> docker build -t coloredrabbit:1.0 .
#   $> docker run -it coloredrabbit:1.0 "./src/main.js" "./topic_channel/coindeskkorea.json"

# node on alpine
FROM node:17.3-alpine3.12

# image metadata
LABEL version="1.0"
LABEL build-date=""
LABEL name="news-collector"
LABEL maintainer="adh0463@gmail.com"
LABEL description=""
LABEL url="https://github.com/coloredrabbit/topic_collector_docker"
LABEL author="coloredrabbit"

USER root

WORKDIR /news_collector

# ensure that install a package as latest version
RUN apk update \
	&& apk add git

# pull sources from git
# RUN ["git", "clone", "https://github.com/coloredrabbit/news_collector.git"]
# RUN git config --global user.name "coloredrabbit"
RUN git clone https://github.com/coloredrabbit/news_collector.git


# Required param1: "./src/main.js"
# Required param2: json file for topic channel
ENTRYPOINT ["node"]